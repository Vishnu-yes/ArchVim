```
# ArchVim

A preconfigured IDE for coders — just download and start coding.  
Minimal, modular, and easy to manage with a simple file structure.  
Comes with **GruvBox dark** and **Hard Material** theming for a comfortable experience.  
Feel free to customize it, but please give credit.  

> ⚡ All configs were primarily written with the help of ChatGPT & Claude.

---

## Overview

**ArchVim** follows the Arch philosophy: *simple, powerful, and customizable*.  

- Preconfigured **LSPs** and autocompletion  
- Modern **UI enhancements**: statusline, bufferline, dashboard, notifications  
- Built-in tools: **Telescope**, **Treesitter**, **Git integration**, **Sessions**, and more  
- Designed for **clarity, speed, and extensibility**  

---
```
## Installation

Backup your current Neovim config (optional but recommended):

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

## Downloading/Cloning :

Download & Open using:
```bash
git clone https://github.com/Vishnu-yes/ArchVim.git ~/.config/nvim
nvim
```
```
## Project's Core Structure


~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua/user
    ├── Basics/        # Core settings, keymaps, options, utilities
    ├── UI/            # Statusline, bufferline, dashboard, git signs, notifications
    ├── config/        # Plugin configs: LSP, Telescope, Treesitter, etc.
    ├── Inbuilt/       # Internal Lua helpers
    └── READ.MD        # Read Useful Stuffs here
```

## Requirements :
• Nvim 0.11.4+
• Git (Optional as You can have to configure a little)
• Nerd Font (Added Inside The Cloned files so You don't feel problems)

## License :
ArchVim is released under the MIT Lisence 

## Purpose of Making :
• To give better feel to low end devices, mid rnages to High ends
• To give Super User Control
• To give Command and Plugins Power
• This Distro contains more very long leader
• Leader's are mapped with space key and Local with " ' "

