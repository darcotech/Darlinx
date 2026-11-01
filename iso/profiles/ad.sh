#!/bin/bash
# Darlinx Active Directory Integration Profile
# Optional enterprise profile - AD integration only
# NOT a standalone profile; must be combined with Base + other template

###############################################################################
# CORE AD INTEGRATION STACK
###############################################################################
ad_core_packages=(
    "realmd"                     # Simple membership service for domain joining
    "sssd"                       # System Security Services Daemon
    "winbind"                    # Windows name resolution (Samba)
    
    # Kerberos authentication
    "krb5"                       # MIT Kerberos v5
    "mit-krb5"                   # Alternative Kerberos implementation
    
    # GSSAPI support
    "gssproxy"                   # Generic Security Services Proxy
)

###############################################################################
# SAMBA & SMB PROTOCOL
###############################################################################
samba_packages=(
    "samba"                      # SMB/CIFS file sharing suite
    "cifs-utils"                 # CIFS filesystem utilities
    "smbclient"                  # Samba CLI client
    
    # Active Directory Domain Services
    "adcli"                      # AD command-line interface
)

###############################################################################
# GPO & POLICY MANAGEMENT
###############################################################################
gpo_packages=(
    "gpupdate"                   # Group Policy update tool
    "gpo-parser"                 # Parse Windows GPO files
    
    # PowerShell for Linux (GPO application)
    "powershell-bin"             # PowerShell Core
)

###############################################################################
# LDAP TOOLS & DIRECTORY ACCESS
###############################################################################
ldap_packages=(
    "openldap"                   # OpenLDAP suite
    "ldap-utils"                 # LDAP command-line tools
    
    # GUI tools for directory browsing
    "ldap-browser"               # Lightweight AD browser (optional)
)

###############################################################################
# HOME DIRECTORY MANAGEMENT
###############################################################################
home_mount_packages=(
    "pam-mh"                     # PAM module for home directories
    "autofs"                     # Automatic filesystem mounting
    
    # Profile migration utilities
    "migemo"                     # Home directory migration tool (if available)
)

###############################################################################
# CERTIFICATE & KEY MANAGEMENT
###############################################################################
cert_packages=(
    "certutil"                   # Certificate database utilities
    "p11-kit"                    # PKCS#11 module management
    
    # S/MIME email integration
    "evolution-crypto-plugins"   # Evolution encryption plugins (if used)
)

###############################################################################
# MONITORING & LOGGING
###############################################################################
ad_monitoring=(
    "realmd-monitor"             # RealD domain monitoring daemon
    "journalctl-ad-filter"       # Custom AD log filter script
    
    # Performance monitoring for domain joins
    "pam-systemd"                # Systemd PAM module
)

###############################################################################
# UTILITY PACKAGES FOR AD ENVIRONMENTS
###############################################################################
ad_utils=(
    "ldapdomaindump"             # Create HTML report of AD environment
    "nmap"                       # Network discovery (AD network mapping)
    "rpcinfo"                    # RPC service inspection
)

# Export all arrays for Calamares integration
export -f install_ad_profile
export ad_core_packages samba_packages gpo_packages ldap_packages \
       home_mount_packages cert_packages ad_monitoring ad_utils