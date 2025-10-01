---

🚀 ArchVim

Your Neovim, ready to code.
Minimal. Fast. Fully configured. Just clone and start hacking.

💡 Features GruvBox Dark & Hard Material themes, modern UI, and carefully curated plugins for productivity.
Customize freely, but remember to give credit.

> ⚡ Configs primarily crafted with a little help from ChatGPT & Claude.




---

✨ Why ArchVim?

ArchVim embraces the Arch Linux philosophy: simple, powerful, and fully customizable.

✅ Preconfigured LSPs & autocompletion

🖌 Modern UI enhancements: statusline, bufferline, dashboard, notifications

🛠 Built-in tools: Telescope, Treesitter, Git integration, Sessions, and more

⚡ Optimized for speed, clarity, and extensibility



---

🛠 Installation

Step 1 — Backup your existing Neovim config (optional):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```
Step 2 — Clone ArchVim:
```bash
git clone https://github.com/Vishnu-yes/ArchVim.git ~/.config/nvim
nvim
```
> ArchVim will automatically install plugins and set up your environment on first run.
> However it will want Lsps to be installed in Linux/Terminal.




---

📂 Project Structure
```
~/.config/nvim
├── init.lua          # Entry point
├── lazy-lock.json    # Plugin lockfile
└── lua/user
    ├── Basics/       # Keymaps, options, and utilities
    ├── UI/           # Statusline, bufferline, dashboard, git signs, notifications
    ├── config/       # Plugin configurations (LSP, Telescope, Treesitter)
    ├── Inbuilt/      # Internal Lua helpers
    └── READ.MD       # Documentation
```

---

⚙️ Requirements

Neovim ≥ 0.11.4

Git (for cloning & updates)

Nerd Font (included for convenience)



---

🎯 Purpose

Provide a smooth experience across all devices

Give users full control over their Neovim setup

Enhance command and plugin workflows

Extended leader key setup for faster navigation:

Space for global

' for local




---

📜 License

Released under the MIT License.


---

<p align="center">Made with ❤️ and Lua</p>
---
