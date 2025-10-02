# 🚀 ArchVim

![ArchVim Logo](https://img.shields.io/badge/ArchVim-Neovim-blue?style=for-the-badge&logo=neovim)  
![License](https://img.shields.io/badge/License-GPLv3-green?style=for-the-badge)  
![Lua](https://img.shields.io/badge/Made%20with-Lua-FFDD00?style=for-the-badge&logo=lua)


Your **pocket IDE** built on Neovim. Minimal, fast, fully configurable, and ready to code—whether on a full desktop or in Termux.

> ArchVim gives you almost all IDE functionality using just commands and the spacebar.

---



<p align="center">
  <img src="https://github.com/user-attachments/assets/ffb9a4d7-3d18-4563-b40f-9eab000d2e2c" width="400"/>
  <img src="https://github.com/user-attachments/assets/3c0f8e00-9e38-416d-be12-980b40f60fc2" width="400"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ebcbf543-59bf-4ae3-b5e7-d3f398d367b7" width="400"/>
  <img src="https://github.com/user-attachments/assets/d293acb6-a31e-4555-889c-265066a10fd8" width="400"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/f32262c0-6cbf-41a3-a650-5715c64a8a86" width="500"/>
</p>


---

## ✨ Features

- **Flexible Plugin Management**:  
  Mason is installed by default, but the primary plugin manager is Lazy. Switch seamlessly between `:Mason` and `:Lazy`.

- **Lightweight**:  
  Only ~6 MBs, optimized for speed and efficiency.

- **Preinstalled Nerd Fonts**:  
  Beautiful icons and glyphs out of the box.

- **Modern & Fancy UI**:  
  Includes statusline, bufferline, dashboard, notifications, and more.

- **Default Hardcore Theme**:  
  Gruvbox Dark Hard for an elegant, distraction-free coding experience.

- **Full IDE Control**:  
  Easily customize plugins or add almost any addon you desire.

- **Cross-Platform**:  
  Works smoothly even in Termux + Neovim—truly portable.

- **LSP Support**:  
  Lazy requires manual LSP downloads, but most common servers are preconfigured. Install them easily via shell commands.

---

## ⚡ Why ArchVim?

ArchVim embraces the **Arch Linux philosophy**: simple, powerful, and fully customizable.  

- Preconfigured LSPs & autocompletion  
- Modern UI enhancements: statusline, bufferline, dashboard, notifications  
- Built-in tools: Telescope, Treesitter, Git integration, Sessions, and more  
- Optimized for speed, clarity, and extensibility  

---

## 🛠 Installation

**Step 1 — Backup existing Neovim config (optional):**
```bash
mv ~/.config/nvim ~/.config/nvim.backup

Step 2 — Clone ArchVim:

git clone https://github.com/Vishnu-yes/ArchVim.git ~/.config/nvim
nvim
```

> On first run, ArchVim will automatically install plugins and set up your environment.
LSP servers may need to be installed manually depending on your system.




---

📂 Project Structure
``` tree
~/.config/nvim
├── init.lua          # Entry point
├── lazy-lock.json    # Plugin lockfile
└── lua/user
    ├── Basics/       # Keymaps, options, utilities
    ├── UI/           # Statusline, bufferline, dashboard, git signs, notifications
    ├── config/       # Plugin configurations (LSP, Telescope, Treesitter)
    ├── Inbuilt/      # Internal Lua helpers
    ├── Fonts         # Pre-installed Nerd Fonts 
    └── Read          # Documentation

```
---

⚙️ Requirements

Neovim ≥ 0.11.4

Git (for cloning and updates)

Nerd Font (preinstalled)



---

🎯 Purpose

Provide a smooth, lightweight coding experience across devices

Give users full control of their Neovim setup

Enhance command and plugin workflows

Extended leader key setup for faster navigation:

Space for global commands

' for local commands




---

📜 License

Released under the GPLv3 License.


---

<p align="center">Made with ❤️ and Lua</p>

---
