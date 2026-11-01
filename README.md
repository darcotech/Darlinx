# Darlinx 🎯

**A Privacy-First Arch-Based Workstation Distro for Professionals & Creators**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/darlinx/darlinx)](releases)
[![Profile Templates](https://img.shields.io/badge/Profiles-7-success)](#profile-templates)

---

## 🌟 What is Darlinx?

Darlinx is a modern Linux distribution built on **Arch Linux** with a unique approach:
- **3-month frozen base snapshot** for stability (like enterprise distros)
- **Privacy-first**: No telemetry, ever (not even optional)
- **Workstation-ready**: Optimized for Blender, CAD, Development, AI tools
- **Flexible profiles**: Choose your ideal setup during installation
- **Optional AD integration**: Enterprise Active Directory support on demand

---

## 🎨 Profile Templates

During installation, select from pre-vetted package collections:

| Profile | Primary Use Case | Key Packages |
|---------|------------------|--------------|
| **Base** | Minimal daily driver | KDE Plasma, Firefox, LibreOffice |
| **CAD/3D** | Design & Engineering | Blender, FreeCAD, KiCad, OpenColorIO |
| **Developer** | Software Development | Docker, VS Code, Git, K8s tools |
| **AI/ML** | Local AI Workloads | PyTorch, TensorFlow, Ollama, Jupyter |
| **Office/Business** | Corporate Productivity | OnlyOffice, Nextcloud, Thunderbird |
| **Gamer** | Gaming + Leisure | Steam, Proton-GE, Lutris, MangoHud |
| **WebDev** | Frontend/Backend Dev | Node.js, Docker, Nginx, PHP |

> ℹ️ **Multi-Profile Support**: Select more than one template (e.g., `CAD + Gaming`).

---

## 🔌 Active Directory Integration (Opt-In)

Darlinx supports Microsoft Active Directory via:
- `realmd` - Domain joining
- `sssd` - Identity/authentication provider  
- `samba/winbind` - File sharing & GPO processing

Only installed if user selects the **Enterprise** checkbox during installation.

---

## 🤝 Contributing

We use community voting to determine which packages go into each profile template:

1. Open an issue on the `profile-cad`, `profile-dev`, etc. labels
2. Submit PRs with package proposals
3. Community votes using GitHub Discussions
4. Maintainers merge after threshold met

---

**Made with ❤️ for professionals who value privacy and performance.**