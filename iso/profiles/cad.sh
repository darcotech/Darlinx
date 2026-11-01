#!/bin/bash
# Darlinx CAD/3D Profile
# For engineers, designers, and 3D artists
# Requires: Base profile installed first

###############################################################################
# 3D MODELING & RENDERING
###############################################################################
cad_3d_packages=(
    "blender"                    # Industry-standard 3D suite
    "freecad"                    # Parametric CAD (SolidWorks alternative)
    "openscad"                   # Script-based CAD (code-driven design)
    
    # Professional rendering engines
    "cine-render"                # Maxon CineRenderer (if available via AUR)
    "octane-render-opencl"       # GPU-accelerated rendering
)

###############################################################################
# PCB & ELECTRONICS DESIGN
###############################################################################
electronics_packages=(
    "kicad"                      # Open-source EDA suite
    "gnetlist"                   # Netlist extraction tool
    "gerbview"                   # Gerber file viewer
)

###############################################################################
# IMAGE PROCESSING & TEXTURES
###############################################################################
image_packages=(
    "gimp"                       # Image manipulation (texture work)
    "imagemagick"                # Command-line image processing
    "inkscape"                   # Vector graphics (SVG)
    
    # Color management for professional workflows
    "opencolorio"                # Industry-standard color management
    "colord"                     # ICC profile management
)

###############################################################################
# PDF & TECHNICAL DOCUMENTATION
###############################################################################
tech_docs_packages=(
    "okular"                     # Technical PDF viewer (annotations)
    "texlive"                    # LaTeX typesetting (engineering docs)
    "dvisvgm"                    # DVI to SVG converter
)

###############################################################################
# PERFORMANCE & GPU TOOLS
###############################################################################
performance_packages=(
    "nvidia-utils"              # NVIDIA GPU utilities (if detected)
    "ocl-icd"                    # OpenCL ICD loader
    "clinfo"                     # OpenCL diagnostic tool
)

###############################################################################
# UTILITY PACKAGES
###############################################################################
cad_utils=(
    "meshlab"                    # Mesh processing/cleanup
    "meshio"                     # Mesh file format conversion
    "freeglut"                   # OpenGL utility library
    "libccd"                     # Collision detection (CAD operations)
)

# Export all arrays for Calamares integration
export -f install_cad_profile
export cad_3d_packages electronics_packages image_packages \
       tech_docs_packages performance_packages cad_utils