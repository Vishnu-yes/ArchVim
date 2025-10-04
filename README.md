<div align="center">

# 🚀 ArchVim

<img src="https://img.shields.io/badge/ArchVim-Neovim-blue?style=for-the-badge&logo=neovim" alt="ArchVim">
<img src="https://img.shields.io/badge/License-GPLv3-green?style=for-the-badge" alt="License">
<img src="https://img.shields.io/badge/Made%20with-Lua-FFDD00?style=for-the-badge&logo=lua" alt="Lua">
<img src="https://img.shields.io/badge/Version-0.3.1-orange?style=for-the-badge" alt="Version">

**Your pocket IDE built on Neovim**  
*Maximum with Minimum Space. Fast. Fully Configurable. Ready to Code.*

[Installation](#-installation) • [Features](#-features) • [Documentation](#-documentation) • [Contributing](#-contributing)

---

![ArchVim Screenshot](https://github.com/user-attachments/assets/37789dfb-064d-4a61-b3ba-7ea2e287f45b)
![ArchVim Dashboard](https://github.com/user-attachments/assets/3daed5ea-5ee8-45dc-9c7b-4061645e3b8f)

</div>

---

## 🎯 What is ArchVim?

ArchVim transforms Neovim into a complete IDE experience while maintaining the speed and elegance of a terminal-based editor. Inspired by the **Arch Linux philosophy**, ArchVim gives you full control without sacrificing convenience.

> **"Almost all IDE functionality using just commands and the spacebar."**

Whether you're coding on a desktop workstation or a mobile device via Termux, ArchVim delivers a consistent, powerful development environment that fits in your pocket.

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎨 Modern UI/UX
- **Beautiful Dashboard** with quick actions
- **Statusline & Bufferline** for efficient navigation
- **Notification System** for clear feedback
- **Git Integration** with visual diff indicators
- **Gruvbox Dark Hard** theme by default
- **Nerd Fonts** preinstalled for perfect icons

</td>
<td width="50%">

### ⚡ Performance & Power
- **Lightweight**: Only ~6 MB footprint
- **Lazy Loading**: Plugins load on demand
- **LSP Support**: Preconfigured language servers
- **Treesitter**: Advanced syntax highlighting
- **Telescope**: Fuzzy finding for everything
- **Session Management**: Pick up where you left off

</td>
</tr>
<tr>
<td width="50%">

### 🛠️ Developer Tools
- **Mason**: Easy LSP/DAP/Linter installation
- **Autocompletion**: Intelligent code completion
- **Git Integration**: Built-in Git workflow
- **File Explorer**: Tree-based navigation
- **Terminal**: Integrated terminal support
- **Snippets**: Code snippet expansion

</td>
<td width="50%">

### 🌍 Cross-Platform
- **Desktop**: Full-featured on Linux/macOS/Windows
- **Termux**: Optimized for mobile coding
- **Portable**: Carry your IDE anywhere
- **Consistent**: Same config everywhere
- **Customizable**: Adapt to your workflow
- **Extensible**: Add any Neovim plugin

</td>
</tr>
</table>

---

## 📋 Requirements

| Component | Version | Notes |
|-----------|---------|-------|
| **Neovim** | ≥ 0.11.4 | Required for core functionality |
| **Git** | Latest | For cloning and plugin management |
| **Nerd Font** | Included | Preinstalled, but can use custom fonts |
| **Node.js** | ≥ 14.x | Optional, for some LSP servers |
| **Python** | ≥ 3.8 | Optional, for Python LSP support |

---

## 🚀 Installation

### Quick Install

```bash
# Backup existing configuration (recommended)
mv ~/.config/nvim ~/.config/nvim.backup

# Or remove if not needed
# rm -rf ~/.config/nvim

# Create nvim directory
cd ~/.config
mkdir -p nvim

# Download and install ArchVim (Latest Release)
curl -L -o ArchVim_v0.3.1.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.1/ArchVim_v0.3.2.zip"

# Verify download
ls -lh ArchVim_v0.3.1.zip

# Extract
unzip -o ArchVim_v0.3.1.zip -d .

# Clean up
rm ArchVim_v0.3.1.zip

# Launch Neovim
nvim
```
> [!IMPORTANT] : Make sure that the Release or ArchVim.zip version must match your desired and avilable version.  

### First Launch

On first startup, ArchVim will:
1. ✅ Automatically install all plugins via Lazy.nvim
2. ✅ Set up Treesitter parsers
3. ✅ Configure Mason for LSP installation
4. ⚠️ Require manual LSP server installation (see below)

> **Note**: First launch may take 1-2 minutes depending on your system and internet connection. On lower-end devices, Neovim may appear frozen—this is normal. Just wait for plugin installation to complete.

### Installing LSP Servers

After installation, install language servers for your preferred languages:

```vim
:Mason
```

Then select and install servers like:
- `lua-language-server` (Lua)
- `pyright` (Python)
- `typescript-language-server` (JavaScript/TypeScript)
- `rust-analyzer` (Rust)
- `clangd` (C/C++)

---

## 📂 Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point & initialization
├── lazy-lock.json          # Plugin version lockfile
└── lua/
    └── user/
        ├── Basics/         # Core keymaps, options & utilities
        ├── UI/             # Statusline, bufferline, dashboard, notifications
        ├── config/         # Plugin configurations (LSP, Telescope, Treesitter)
        ├── Inbuilt/        # Internal Lua helpers & utilities
        ├── Fonts/          # Preinstalled Nerd Fonts
        └── Read/           # Documentation & guides
```

---

## ⌨️ Key Bindings

### Leader Keys

ArchVim uses an extended leader key system:

| Key | Purpose | Example |
|-----|---------|---------|
| `<Space>` | **Global leader** | `<Space>ff` - Find files |
| `'` | **Local leader** | `'d` - Local diagnostics |

### Essential Keymaps

<details>
<summary><b>File Navigation (Telescope)</b></summary>

| Keymap | Action |
|--------|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Browse buffers |
| `<Space>fh` | Help tags |
| `<Space>fo` | Old files |

</details>

<details>
<summary><b>LSP Operations</b></summary>

| Keymap | Action |
|--------|--------|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename |

</details>

<details>
<summary><b>Buffer & Window Management</b></summary>

| Keymap | Action |
|--------|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<Space>bd` | Close buffer |
| `<C-h/j/k/l>` | Navigate windows |

</details>

<details>
<summary><b>Git Integration</b></summary>

| Keymap | Action |
|--------|--------|
| `<Space>gs` | Git status |
| `<Space>gc` | Git commits |
| `<Space>gb` | Git branches |
| `[c` | Previous hunk |
| `]c` | Next hunk |

</details>

> Full keymap reference available in `lua/user/Basics/keymaps.lua`

---

## 🎨 Customization

### Changing Theme

Edit `lua/user/config/colorscheme.lua`:

```lua
-- Available themes: gruvbox, tokyonight, catppuccin, nord, etc.
vim.cmd("colorscheme gruvbox")
```

### Adding Plugins

Edit `~/.config/nvim/lua/user/Basic/plugins.lua` and add your plugin:

```lua
return {
  -- Your new plugin
  {
    "author/plugin-name",
    config = function()
      require("plugin-name").setup({})
    end
  }
}
```

Then run `:Lazy sync` to install.

### Modifying Keymaps

Edit `lua/user/Basics/keymaps.lua`:

```lua
local map = vim.keymap.set

map("n", "<your-key>", "<your-command>", { desc = "Description" })
```
> Better to use whick key wk.add{}
> For Function/Local module take a look at Inbuilt/ 
---

## 🐛 Troubleshooting

<details>
<summary><b>ArchVim freezes on first launch</b></summary>

This is normal behavior during plugin installation, especially on lower-end devices. Wait 2-5 minutes. If it persists, restart Neovim and run `:Lazy restore`.

</details>

<details>
<summary><b>LSP not working</b></summary>

1. Check if LSP server is installed: `:Mason`
2. Verify LSP is attached: `:LspInfo`
3. Check logs: `:LspLog`
4. Restart LSP: `:LspRestart`

</details>

<details>
<summary><b>Icons not displaying correctly</b></summary>

Ensure your terminal uses a Nerd Font. Preinstalled fonts are in `lua/user/Fonts/`. Configure your terminal to use one of these fonts.

</details>

<details>
<summary><b>Plugins not loading</b></summary>

Run `:Lazy check` and `:Lazy update`. If issues persist, delete `~/.local/share/nvim` and restart Neovim.

</details>

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Reporting Issues

Open an issue with:
- ArchVim version
- Neovim version (`nvim --version`)
- Steps to reproduce
- Expected vs actual behavior

### Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Create a release package:

```bash
cd ~/.config/nvim
zip -r ~/ArchVim.zip ./*
```

6. Submit a pull request with:
   - Clear description of changes
   - Why the change is needed
   - Testing performed

> **Please contact the maintainer before submitting major changes to discuss the approach.**

---

## 📚 Documentation

- **[Quick Start Guide](lua/user/Read/)** - Get started in 5 minutes
- **[Keybindings Reference](lua/user/Basics/keymaps.lua)** - Complete keymap list
- **[Plugin Documentation](lua/user/config/)** - Individual plugin configs
- **[Troubleshooting](lua/user/Read/)** - Common issues & solutions

---

## 🙏 Acknowledgments

ArchVim is built on the shoulders of giants:

- [Neovim](https://neovim.io/) - The extensible editor
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin management
- [Mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- The entire Neovim community

---

## 📜 License

ArchVim is released under the **[GNU General Public License v3.0](LICENSE)**.

```
Copyright (C) 2024 ArchVim Contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
```

---

## 🌟 Star History

If you find ArchVim useful, consider giving it a star! ⭐

---

<div align="center">

### 💖 Made with Love and Lua

**[Report Bug](https://github.com/Vishnu-yes/ArchVim/issues)** • **[Request Feature](https://github.com/Vishnu-yes/ArchVim/issues)** • **[Discussions](https://github.com/Vishnu-yes/ArchVim/discussions)**

*Empowering developers, one keystroke at a time.*

---

[![Twitter Follow](https://img.shields.io/twitter/follow/yourusername?style=social)](https://twitter.com/yourusername)
[![GitHub followers](https://img.shields.io/github/followers/Vishnu-yes?style=social)](https://github.com/Vishnu-yes)

</div>
