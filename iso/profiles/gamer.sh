#!/bin/bash
# Darlinx Gaming Profile
# For gaming, emulation, and performance optimization
# Requires: Base profile installed first + GPU driver selection

###############################################################################
# GAME PLATFORMS & LAUNCHERS
###############################################################################
platform_packages=(
    "steam"                      # Valve Steam client
    "lutris"                     # Multi-platform game launcher
    "bottles"                    # Wine manager for Windows games
    "heroic-bin"                 # Epic Games Store + GOG client
    "gnome-software"             # Software center with plugin support
)

###############################################################################
# COMPATIBILITY LAYERS
###############################################################################
compatibility_packages=(
    "wine-ge-custom-bin"         # Wine GE (GloriousEggroll build)
    "proton-ge-custom-bin"       # Proton GE (enhanced Steam compatibility)
    "proton-nvidia"              # NVIDIA-specific Proton
    "d8vk"                       # DirectX-to-Vulkan layer
    
    # Additional wine options
    "wine-staging"               # Wine with experimental features
)

###############################################################################
# PERFORMANCE OPTIMIZATION
###############################################################################
performance_packages=(
    "gamemode"                   # Feral gamemode (CPU/GPU tuning)
    "gamescope"                  # Wayland compositor (Steam Deck experience)
    "mangohud"                   # Performance overlay (FPS, temps)
    "corectrl"                   # GPU/CPU overclocking GUI
    
    # Kernel performance patches (optional)
    # "linux-zen"               # Performance-optimized kernel
)

###############################################################################
# INPUT & CONTROLLERS
###############################################################################
input_packages=(
    "xinput-calibrator"          # Touchscreen calibration
    "sc Controller"              # Controller mapper GUI
    "qgamepad"                   # Gamepad testing tool
    
    # VR support (optional, user selection)
    # "openvr"                  # OpenVR runtime
    # "vibrant"                 # VR settings manager
)

###############################################################################
# EMULATION
###############################################################################
emulation_packages=(
    "retroarch"                  # Multi-system emulator core
    "mame"                       # Arcade machine emulator
    "dolphin-qt"                 # GameCube/Wii emulator
    "rpcs3"                      # PlayStation 3 emulator
    "yuzu"                       # Nintendo Switch emulator (optional)
    
    # Retro gaming frontend
    "es-qt"                      # EmulationStation frontend
)

###############################################################################
# MODS & CUSTOMIZATION
###############################################################################
modding_packages=(
    "vorbis-tools"               # OGG audio codec tools
    "flac"                       # Lossless audio format
    "audacious"                  # Audio player (supports mod files)
    
    # Game mod managers
    "vortex"                     # Mod manager for games (optional)
    "modorganizer2"              # Bethesda game mod manager
)

###############################################################################
# STREAMING & RECORDING
###############################################################################
streaming_packages=(
    "obs-studio"                 # Open Broadcaster Software
    "vlc"                        # Recording/Streaming backend (already in base)
    "ffmpeg"                     # Video encoding/transcoding
    
    # Stream deck alternatives
    "streamdeck-ui"              # Linux Stream Deck GUI
)

###############################################################################
# GPU DRIVERS (User Selectable During First-Boot)
###############################################################################
driver_packages=(
    # Intel:
    "mesa"                       # OpenGL/Vulkan drivers
    "vulkan-intel"               # Intel Vulkan support
    
    # AMD:
    "vulkan-radeon"              # AMD Vulkan support
    "amdvlk"                     # AMD official Vulkan driver
    "libva-mesa-driver"          # Video acceleration for AMD
    
    # NVIDIA (if detected):
    "nvidia-utils"               # NVIDIA utilities
    "nvtop"                      # GPU monitoring (already in AI profile)
)

# Export all arrays for Calamares integration
export -f install_gamer_profile
export platform_packages compatibility_packages performance_packages \
       input_packages emulation_packages modding_packages streaming_packages driver_packages