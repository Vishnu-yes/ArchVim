# 🚀 ArchVim

![ArchVim Logo](https://img.shields.io/badge/ArchVim-Neovim-blue?style=for-the-badge&logo=neovim)  
![License](https://img.shields.io/badge/License-GPLv3-green?style=for-the-badge)  
![Lua](https://img.shields.io/badge/Made%20with-Lua-FFDD00?style=for-the-badge&logo=lua)


Your **pocket IDE** built on Neovim. Minimal, fast, fully configurable, and ready to code—whether on a full desktop or in Termux.

> ArchVim gives you almost all IDE functionality using just commands and the spacebar.

---



![1000042281](https://github.com/user-attachments/assets/37789dfb-064d-4a61-b3ba-7ea2e287f45b)
![1000042283](https://github.com/user-attachments/assets/3daed5ea-5ee8-45dc-9c7b-4061645e3b8f)


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
> If you have important config then do this
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

> If you want to delete your existing config then
```bash
rm -rf ~/.config/nvim
```

**Step 2 — Clone ArchVim:**

```bash
cd ~/.config
mkdir -p nvim
curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/raw/main/AV0.2.zip"
unzip -o AV0.2.zip -d nvim
rm AV0.2.zip
```

> On first run, ArchVim will automatically install plugins and set up your environment.
LSP servers may need to be installed manually depending on your system.

> Sometimes ArchVim could crash your PC or Mobile due to sudden downloading
> Don't worry just retry , this issue is common on Bad Processor Devices
> I even faced them while I was creating this Distro with Vibe coding in Iqoo Z6 Lite 5g 


---
## For those who wants to Contribute Do create a Zip file with 
```bash
cd ~/.config/nvim
zip -r ~/ArchVim.zip ./*
```
> Don't forget to contact me to commit changes.
> Explain Clearly What you Changed and Why
> If You can solve any Problem then please contact ASAP
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
