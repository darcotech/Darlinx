#!/usr/bin/env python3
# Darlinx Calamares Backend Module
# Handles profile selection, merging, and validation

import json
import os
from pathlib import Path

class DarlinxProfileBackend:
    """Backend logic for Darlinx profile selection during installation."""
    
    def __init__(self):
        self.profiles_path = Path(__file__).parent.parent / "iso/profiles"
        self.config_path = Path(__file__).parent / "profiles.json"
        self.selected_profiles = []
        self.merged_packages = set()
        
    def get_available_profiles(self):
        """Load and return all available profiles with metadata."""
        if not self.config_path.exists():
            # Fallback: read from shell scripts directly
            return self._scan_profiles_directory()
            
        with open(self.config_path, 'r') as f:
            config = json.load(f)
            
        return config['profiles']
    
    def _scan_profiles_directory(self):
        """Fallback method to discover profiles from .sh files."""
        profiles = []
        base_profile_names = [
            'base', 'cad', 'dev', 'ai', 'office', 'gamer', 'webdev', 'ad'
        ]
        
        for script_name in base_profile_names:
            script_path = self.profiles_path / f"{script_name}.sh"
            if script_path.exists():
                profiles.append({
                    'id': script_name,
                    'name': script_name.title().replace('_', ' '),
                    'description': f"Profile for {script_name}",
                    'packages': self._extract_packages(script_path),
                    'required': (script_name == 'base')
                })
                
        return profiles
    
    def _extract_packages(self, script_path):
        """Parse a shell script to extract package list."""
        # Basic parsing - more robust in production would use AST
        packages = []
        with open(script_path, 'r') as f:
            content = f.read()
            
            # Look for package arrays (simplified extraction)
            import re
            array_pattern = r'"([^"]+)"\s*#'  # Match "package_name" # comment
            
            for match in re.findall(array_pattern, content):
                if '//' not in match:  # Skip C++ style comments in shell
                    packages.append(match)
                    
        return packages
    
    def select_profile(self, profile_id):
        """Add a profile to the selected list."""
        profiles = self.get_available_profiles()
        
        if profile_id not in profiles:
            raise ValueError(f"Profile '{profile_id}' not found")
            
        profile = profiles[profile_id]
        
        # Check for conflicts with existing selections
        for selected_id in self.selected_profiles:
            selected_profile = profiles[selected_id]
            if profile.get('conflicts_with', []).append(selected_id):
                return False, f"Conflict: {profile['name']} conflicts with {selected_profile['name']}"
                
        # Check selection limit (if configured)
        max_selections = 7  # Base + 6 other profiles max
        if len(self.selected_profiles) >= max_selections:
            return False, "Maximum profiles selected"
            
        self.selected_profiles.append(profile_id)
        
        # Auto-recommend related profiles
        if profile.get('recommends'):
            for recommended in profile['recommends']:
                if recommended not in self.selected_profiles:
                    # Could auto-add or just warn user - up to UI decision
                    pass
                    
        return True, f"Added {profile['name']}"
    
    def deselect_profile(self, profile_id):
        """Remove a profile from the selection."""
        if profile_id in self.selected_profiles:
            self.selected_profiles.remove(profile_id)
            return True, f"Removed {profile_id}"
            
        return False, f"Profile {profile_id} not selected"
    
    def merge_packages(self):
        """Merge all selected profiles into a single package list."""
        if not self.selected_profiles:
            return []
            
        merged = set()
        duplicates = {}
        profiles = self.get_available_profiles()
        
        for profile_id in self.selected_profiles:
            profile = profiles[profile_id]
            for package in profile['packages']:
                if package in merged:
                    # Track duplicates for logging
                    duplicates[package] = duplicates.get(package, 0) + 1
                else:
                    merged.add(package)
                    
        self.merged_packages = sorted(list(merged))
        
        # Log duplicates (for debugging/calamares output)
        if duplicates:
            print(f"Duplicate packages detected: {duplicates}")
            
        return list(self.merged_packages)
    
    def calculate_size_estimate(self):
        """Calculate total estimated installation size."""
        profiles = self.get_available_profiles()
        total_mb = 0
        
        for profile_id in self.selected_profiles:
            if profile_id in profiles:
                # Use metadata or estimate based on package count
                profile = profiles[profile_id]
                avg_package_size = 50  # MB (rough estimate)
                
                for package in profile['packages']:
                    total_mb += avg_package_size
                    
        return total_mb
    
    def get_profile_dependencies(self, profile_id):
        """Get required dependencies for a profile."""
        profiles = self.get_available_profiles()
        
        if profile_id not in profiles:
            return []
            
        profile = profiles[profile_id]
        dependencies = ['base']  # Base is always required
        
        # Add any 'recommends' that aren't already selected
        if profile.get('recommends'):
            for recommended in profile['recommends']:
                if recommended not in self.selected_profiles:
                    dependencies.append(recommended)
                    
        return list(set(dependencies))
    
    def validate_selection(self):
        """Validate current selection and return status."""
        if not self.selected_profiles:
            return False, "No profiles selected"
            
        if 'base' not in self.selected_profiles:
            return False, "Base profile is required"
            
        # Check for conflicts
        profiles = self.get_available_profiles()
        for i, id1 in enumerate(self.selected_profiles):
            for id2 in self.selected_profiles[i+1:]:
                p1 = profiles[id1]
                p2 = profiles[id2]
                
                if id2 in p1.get('conflicts_with', []):
                    return False, f"Conflict: {id1} and {id2} are incompatible"
                    
        return True, "Selection valid"


# Calamares module interface (required methods)
def init_module():
    """Called when Calamares loads the module."""
    global backend
    backend = DarlinxProfileBackend()
    print("Darlinx Profile Module initialized")


def on_starting_job_set():
    """Called when installation job starts."""
    print(f"Selected profiles: {backend.selected_profiles}")
    packages = backend.merge_packages()
    print(f"Merged package list: {len(packages)} packages")


def finish_job():
    """Called when module completes its work."""
    status, message = backend.validate_selection()
    
    if status:
        print("Profile selection completed successfully")
        # Write selected profiles to Calamares variables for later stages
        import calamares
        calamares.globalvariables().setValue(
            'darlinx_selected_profiles',
            backend.selected_profiles
        )
    else:
        raise RuntimeError(message)