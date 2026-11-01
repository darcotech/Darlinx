#!/bin/bash
# Darlinx Software Developer Profile
# For full-stack, backend, and systems programmers
# Requires: Base profile installed first

###############################################################################
# VERSION CONTROL
###############################################################################
vcs_packages=(
    "git"                        # Core Git (already in base, but explicit)
    "git-lfs"                    # Large file storage
    "subversion"                 # SVN (legacy enterprise support)
    "mercurial"                  # Mercurial (optional, some projects use it)
)

###############################################################################
# IDEs & CODE EDITORS
###############################################################################
ide_packages=(
    "visual-studio-code-bin"     # VS Code (popular, cross-platform)
    "geany"                      # Lightweight alternative
    "kate"                       # KDE native editor (already in base)
    
    # Optional: JetBrains tools (user selects during first-boot)
    # "intellij-idea-community-edition"
    # "pycharm-community-edition"
)

###############################################################################
# CONTAINERS & ORCHESTRATION
###############################################################################
container_packages=(
    "docker"                     # Docker engine
    "docker-compose"             # Docker Compose
    "podman"                     # Podman (rootless option)
    
    # Kubernetes tools
    "kubectl"                    # K8s CLI
    "helm"                       # Package manager for K8s
    "minikube"                   # Local K8s cluster
    "kind"                       # K8s-in-Docker tool
)

###############################################################################
# COMPILERS & BUILD TOOLS
###############################################################################
compiler_packages=(
    "gcc"                        # GNU C compiler
    "clang"                      # LLVM C/C++ compiler
    "gdb"                        # Debugger (C/C++)
    "make"                       # Build automation
    "cmake"                      # Cross-platform build system
    "meson"                      # Modern build system
    "ninja"                      # Fast build system (used by Meson)
)

###############################################################################
# RUNTIMES & INTERPRETERS
###############################################################################
runtime_packages=(
    "python"                     # Python 3.x
    "pipx"                       # Python CLI tool installer
    "nodejs"                     # Node.js runtime
    "npm"                        # Node package manager
    "yarn"                       # Alternative Node PM
    "ruby"                       # Ruby runtime
    "rustup"                     # Rust toolchain manager
    "go"                         # Go compiler
    
    # Optional: Additional interpreters
    # "perl"
    # "lua"
)

###############################################################################
# VIRTUALIZATION & EMULATION
###############################################################################
virt_packages=(
    "virtualbox"                 # VirtualBox (easy to use)
    # "qemu-kvm"                  # KVM + QEMU (native Linux virtualization)
    # "libvirt"                   # LibVirt management suite
)

###############################################################################
# API & TESTING TOOLS
###############################################################################
api_packages=(
    "postman"                    # API testing GUI
    "insomnia"                   # Postman alternative
    "httpie"                     # Command-line HTTP client
    "jq"                         # JSON processor
    "fzf"                        # Fuzzy finder (enhances CLI workflows)
)

###############################################################################
# UTILITY PACKAGES
###############################################################################
dev_utils=(
    "tmux"                       # Terminal multiplexer
    "neovim"                     # Vim fork (powerful, scriptable)
    "ripgrep"                    # Fast grep replacement
    "fd"                         # Fast find replacement
    "exa"                        # Modern ls replacement
    "bat"                        # Cat with syntax highlighting
    
    # CI/CD tools for local testing
    "act"                        # Run GitHub Actions locally
    "pre-commit"                 # Git hooks manager
)

# Export all arrays for Calamares integration
export -f install_dev_profile
export vcs_packages ide_packages container_packages compiler_packages \
       runtime_packages virt_packages api_packages dev_utils