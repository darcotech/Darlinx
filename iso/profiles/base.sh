#!/bin/bash
# Darlinx Base Profile (v0.1)
# Core system packages - no telemetry, functional daily driver
# No template-specific packages included

###############################################################################
# CORE SYSTEM PACKAGES
###############################################################################
# Essential Arch infrastructure (already minimal, but documented for clarity)
core_packages=(
    "systemd"                    # Init system (standard on Arch)
    "pacman"                     # Package manager
    "bash"                       # Default shell
    "zsh"                        # Alternative shell (user choice)
    "grub"                       # Bootloader
    "linux-firmware"             # Hardware support
    "sudo"                       # Privilege escalation
    "inetutils"                  # Basic networking tools
    "procps-ng"                  # System monitoring (top, ps, free)
)

###############################################################################
# KDE PLASMA DESKTOP (Minimal + Utilities Only)
###############################################################################
# NOT using kde-full to avoid bloat; selected utilities explicitly
plasma_packages=(
    "plasma-desktop"             # Core Plasma workspace
    "kwin"                       # Window manager
    "sddm"                       # Display manager (login screen)
    
    # Essential KDE Utilities
    "dolphin"                    # File manager
    "konsole"                    # Terminal emulator
    "kate"                       # Text editor (Lightweight alternative to VS Code)
    "gwenview"                   # Image viewer
    
    # System utilities
    "kinfocenter"                # Hardware information tool
    "systemsettings"             # System configuration GUI
    "ark"                        # Archive manager (zip, tar, etc.)
    "kcalc"                      # Calculator
    "ksystemstats"               # Resource monitoring
)

###############################################################################
# NETWORKING
###############################################################################
network_packages=(
    "NetworkManager"             # Primary network management
    "wpa_supplicant"             # WiFi authentication
    "dhcpcd"                     # DHCP client
    "iw"                         # WiFi configuration
    "speedtest-cli"              # Network performance testing (lightweight)
)

###############################################################################
# BROWSER
###############################################################################
# User can choose one; Firefox recommended for privacy focus
browser_packages=(
    "firefox"                    # Default browser (privacy-focused)
    # "chromium"                 # Alternative (user selection during first-boot)
)

###############################################################################
# OFFICE / PRODUCTIVITY
###############################################################################
# Minimal office suite for basic documents only
office_packages=(
    "libreoffice-fresh"          # Office suite (Writer, Calc only for base)
)

###############################################################################
# MEDIA
###############################################################################
media_packages=(
    "vlc"                        # Video player (handles all formats)
    "mpv"                        # Lightweight video player
    "kamoso"                     # Simple camera app
)

###############################################################################
# SYSTEM TOOLS & MONITORING
###############################################################################
tools_packages=(
    "htop"                       # Interactive process viewer
    "btop"                       # Modern system monitor (optional, nice UI)
    "ncdu"                       # Disk usage analyzer
    "timeshift"                  # System restore points (important for profiles!)
    
    # Backup utilities
    "rsync"                      # File synchronization
    "restic"                     # Encrypted backups
)

###############################################################################
# PRINTING & SCANNING (Optional, but common use case)
###############################################################################
print_packages=(
    "cups"                       # Common Unix Print System
    "system-config-printer"      # CUPS GUI
    "simple-scan"                # Document scanner
)

###############################################################################
# MISC / USEFUL UTILITIES
###############################################################################
misc_packages=(
    "wget"                       # File downloads (non-interactive)
    "curl"                       # HTTP client
    "zip" "unzip"               # Compression utilities
    "git"                        # Version control (essential for dev, but minimal here)
    "neofetch"                   # System info display (popular in Linux community)
    "brightnessctl"             # Screen brightness control
    "pavucontrol"               # PulseAudio volume control GUI
    "nm-connection-editor"      # Network connections GUI
)

###############################################################################
# KERNEL OPTIONS (User selection during first-boot wizard)
###############################################################################
# Note: Kernel is user-selectable, not included in base.sh
# Options: linux (standard), linux-lts (stable), linux-zen (optimized)
kernel_packages=(
    # "linux"                    # Standard Arch kernel (default)
    # "linux-lts"               # Long-term support kernel
    # "linux-zen"               # Performance-optimized kernel
)

###############################################################################
# DRIVERS (User selection during first-boot wizard)
###############################################################################
# GPU drivers selected based on hardware detection in first-boot
driver_packages=(
    # Intel:
    # "mesa" "vulkan-intel" "intel-media-driver"
    
    # AMD:
    # "mesa" "vulkan-radeon" "libva-mesa-driver"
    
    # NVIDIA:
    # "nvidia" "nvidia-utils" "nvidia-settings"
)

###############################################################################
# PACKAGE INSTALLATION LOGIC
###############################################################################

# Function to install packages from array
install_base_packages() {
    echo "=== Installing Darlinx Base Profile ==="
    echo ""
    
    # Combine all arrays into one master list
    local all_packages=("${core_packages[@]}" \
                        "${plasma_packages[@]}" \
                        "${network_packages[@]}" \
                        "${browser_packages[@]}" \
                        "${office_packages[@]}" \
                        "${media_packages[@]}" \
                        "${tools_packages[@]}" \
                        "${print_packages[@]}" \
                        "${misc_packages[@]}")
    
    # Print package count for transparency
    echo "Total packages to install: ${#all_packages[@]}"
    echo ""
    echo "Package list:"
    printf '  - %s\n' "${all_packages[@]}"
    echo ""
    
    # Execute installation (adjust based on actual installer context)
    # Example: pacman -Sy --noconfirm "${all_packages[@]}"
    
    # For Calamares integration, export the array:
    # export DARLINX_BASE_PACKAGES="${all_packages[*]}"
}

# Export for use by other scripts or Calamares module
export -f install_base_packages
export core_packages plasma_packages network_packages browser_packages \
       office_packages media_packages tools_packages print_packages misc_packages