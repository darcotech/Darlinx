#!/bin/bash
# Darlinx Office & Business Profile
# For corporate productivity and document workflows
# Requires: Base profile installed first

###############################################################################
# OFFICE SUITES
###############################################################################
office_packages=(
    "libreoffice"                # Full LibreOffice suite (Writer, Calc, Impress)
    "onlyoffice-desktopeditors"  # MS-compatible office alternative
    "wps-office-freetype"        # Alternative to Microsoft Office
)

###############################################################################
# EMAIL & CALENDAR
###############################################################################
email_packages=(
    "thunderbird"                # Mozilla email client
    "evolution"                  # Outlook-like experience
    "geary"                      # Lightweight email client (optional)
    
    # Calendar integration
    "calibrate"                  # Calendar tool (if available)
)

###############################################################################
# CLOUD STORAGE & SYNC
###############################################################################
cloud_packages=(
    "nextcloud-desktop"          # Nextcloud client (self-hosted focus)
    "owncloud-client"            # OwnCloud client
    "syncthing"                  # P2P file synchronization
    
    # Web-based options documented but not installed by default
    # Google Drive, Dropbox available via browser only
)

###############################################################################
# REMOTE ACCESS & COLLABORATION
###############################################################################
remote_packages=(
    "remmina"                    # Multi-protocol RDP/VNC client
    "freerdp"                    # RDP client library
    "tigervnc"                   # VNC server/client
    "xfreerdp"                   # X11 Remote Desktop
    
    # Video conferencing (optional, user selection)
    # "zoom-x64"                 # Zoom desktop client
    # "teams-for-linux"         # Microsoft Teams (community build)
)

###############################################################################
# DOCUMENT MANAGEMENT & PDF
###############################################################################
document_packages=(
    "okular"                     # Advanced PDF viewer (annotation support)
    "pdfarranger"                # PDF merging/splitting
    "qpdf"                       # Command-line PDF processing
    "pdftk"                      # PDF manipulation toolkit
    
    # Scanning
    "simple-scan"                # Document scanner (already in base)
    "scanimage"                  # Scanner imaging API
)

###############################################################################
# COMMUNICATION & CHAT
###############################################################################
chat_packages=(
    "element-desktop"            # Matrix/Electron chat client
    "pidgin"                     # Multi-protocol messenger (legacy)
    
    # Business communication
    # "slack-bin"               # Slack desktop app (optional)
    # "discord"                 # Discord for team chat (optional)
)

###############################################################################
# FORMATS & CONVERSION
###############################################################################
conversion_packages=(
    "libreoffice-librelogo"      # LibreLogo scripting extension
    "unoconv"                    # Document conversion utility
    "filezilla"                  # FTP/SFTP client
    "transmission-qt"            # BitTorrent client (large file sharing)
)

###############################################################################
# PDF & DOCUMENT SIGNING
###############################################################################
signature_packages=(
    "gpg"                        # GnuPG (signing/encryption)
    "seahorse"                   # GNOME password manager (certificate storage)
    
    # PDF signature tools
    "pdfpc"                      # PDF presentation viewer with notes
)

# Export all arrays for Calamares integration
export -f install_office_profile
export office_packages email_packages cloud_packages remote_packages \
       document_packages chat_packages conversion_packages signature_packages