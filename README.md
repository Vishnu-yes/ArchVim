<div align="center">

# 🚀 ArchVim

<p align="center">
  <img src="https://img.shields.io/badge/ArchVim-Neovim-blue?style=for-the-badge&logo=neovim" alt="ArchVim">
  <img src="https://img.shields.io/badge/License-GPLv3-green?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Made%20with-Lua-FFDD00?style=for-the-badge&logo=lua" alt="Lua">
  <img src="https://img.shields.io/badge/Version-0.3.2-orange?style=for-the-badge" alt="Version">
</p>

### ⚡ The Best IDE to Have!

#### 🔥 Almost Max Potential of a IDE , Powerful Commands , Full Workspace.


https://github.com/user-attachments/assets/b0ed7f7c-c14c-487d-aef4-e417c9ecc921

<p align="center">
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-features">Features</a> •
  <a href="#-installation">Installation</a> •
  <a href="#%EF%B8%8F-keybindings">Keybindings</a> •
  <a href="#-contributing">Contributing</a>
</p>

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/37789dfb-064d-4a61-b3ba-7ea2e287f45b" alt="ArchVim Screenshot" width="45%">
  <img src="https://github.com/user-attachments/assets/3daed5ea-5ee8-45dc-9c7b-4061645e3b8f" alt="ArchVim Dashboard" width="45%">
</p>

</div>

---

## 🎯 What is ArchVim?

**Arch Vim is fully made on Termux and is for all Architectures , Is actualy maintained with the Help of Claude(mostly) and Chatgpt(Partly)**
**ArchVim** transforms Neovim into a complete IDE experience while maintaining terminal-level speed and elegance.
Inspired By Vim Nvim Linux and Termux!



> 💡 **"Almost all IDE functionality using just commands and the spacebar."**

Perfect for developers who code anywhere—from desktop workstations to mobile devices via Termux. Your development environment fits in your pocket and follows you everywhere.

---

## ✨ Features

<table>
<tr>
<td width="50%" valign="top">

### 🎨 **Modern UI/UX**
- ✅ Beautiful dashboard with quick actions
- ✅ Smart statusline & bufferline
- ✅ Elegant notification system
- ✅ Git integration with visual indicators
- ✅ Gruvbox Dark Hard theme (+ 67 more!)
- ✅ Nerd Fonts preinstalled

</td>
<td width="50%" valign="top">

### ⚡ **Performance**
- 🚀 Only ~6 MB footprint
- 🚀 Lazy loading for instant startup
- 🚀 Preconfigured LSP servers
- 🚀 Treesitter syntax highlighting
- 🚀 Telescope fuzzy finding
- 🚀 Auto-save session management

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🛠️ **Developer Tools**
- 🔧 Mason for easy LSP/DAP/Linter setup
- 🔧 Intelligent code completion
- 🔧 Built-in Git workflow
- 🔧 Tree-based file explorer
- 🔧 Integrated terminal
- 🔧 Code snippet expansion

</td>
<td width="50%" valign="top">

### 🌍 **Cross-Platform**
- 🌐 Full-featured on Linux/macOS/Windows
- 🌐 Optimized for Termux (mobile coding)
- 🌐 Portable—carry your IDE anywhere
- 🌐 Consistent config everywhere
- 🌐 Fully customizable
- 🌐 Plugin ecosystem ready

</td>
</tr>
</table>

---

## 📋 Requirements

| Component | Version | Purpose |
|-----------|---------|---------|
| **Neovim** | ≥ 0.11.4 | Core editor functionality |
| **Git** | Latest | Plugin management & version control |
| **Nerd Font** | Included | Icons and glyphs (preinstalled) |
| **Node.js** | ≥ 14.x | Optional - for some LSP servers |
| **Python** | ≥ 3.8 | Optional - for Python LSP |

---

## 🚀 Quick Start

### One-Line Install

```bash
cd ~/.config && mkdir -p nvim && curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.2/ArchVim_v0.3.2.zip" && unzip -o ArchVim.zip -d nvim && rm ArchVim.zip && nvim
```

### Post-Install Setup

1. **Wait for plugins to install** (1-2 minutes on first launch)
2. **Install LSP servers**: Run `:Mason` and select your languages
3. **Start coding!** 🎉

---

## 📦 Installation

### Method 1: Quick Install (Replaces Existing Config)

```bash
# Backup existing configuration (recommended)
mv ~/.config/nvim ~/.config/nvim.backup

# Create nvim directory
mkdir -p ~/.config/nvim && cd ~/.config/nvim

# Download latest release
curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.5/ArchVim_v0.3.5.zip"

# Extract and clean up
unzip -o ArchVim.zip && rm ArchVim.zip

# Launch ArchVim
nvim
```

> ⚠️ **Warning**: This replaces your existing Neovim configuration. Back it up first!

---

### Method 2: Safe Install (Parallel Installation)

Test ArchVim without touching your existing Neovim setup:

```bash
# Create separate directory
mkdir -p ~/.config/avim && cd ~/.config/avim

# Download latest release
curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.5/ArchVim_v0.3.5.zip"

# Extract and clean up
unzip -o ArchVim.zip && rm ArchVim.zip

# Launch temporarily
NVIM_APPNAME=avim nvim
```

#### Make It Permanent

**For Bash:**
```bash
echo "alias avim='NVIM_APPNAME=avim nvim'" >> ~/.bashrc && source ~/.bashrc
```

**For Zsh:**
```bash
echo "alias avim='NVIM_APPNAME=avim nvim'" >> ~/.zshrc && source ~/.zshrc
```

Now use `avim` command to launch ArchVim anytime!

---

### 🗑️ Clean Uninstall

Remove all traces of ArchVim:

```bash
# Remove configuration
rm -rf ~/.config/avim

# Remove plugin data
rm -rf ~/.local/share/avim

# Remove state files
rm -rf ~/.local/state/avim

# Remove cache
rm -rf ~/.cache/avim
```

---

## 🔧 First Launch

> ⏱️ **First startup takes 1-2 minutes** while plugins install automatically.

ArchVim will automatically:
1. ✅ Install all plugins via Lazy.nvim
2. ✅ Set up Treesitter parsers
3. ✅ Configure Mason

**You need to manually:**
- Install LSP servers via `:Mason` (pick your languages)

> ⚠️ **On low-end devices**, Neovim may appear frozen during installation—this is normal. Just wait!

---

## 📂 Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin versions
└── lua/
    └── user/
        ├── Basics/         # Keymaps, options, utilities
        ├── UI/             # Statusline, bufferline, dashboard
        ├── config/         # LSP, Telescope, Treesitter configs
        ├── Inbuilt/        # Internal Lua helpers
        ├── Fonts/          # Preinstalled Nerd Fonts
        └── Read/           # Documentation
```

---

## ⌨️ Keybindings

### Leader Keys

| Key | Purpose | Example |
|-----|---------|---------|
| `<Space>` | **Global leader** | `<Space>ff` - Find files |
| `'` | **Local leader** | `'d` - Diagnostics |

---

### 📁 File Navigation (Telescope)

| Keymap | Action |
|--------|--------|
| `<Space>ff` | 🔍 Find files |
| `<Space>fg` | 🔎 Live grep (search in files) |
| `<Space>fb` | 📄 Browse buffers |
| `<Space>fh` | ❓ Help tags |
| `<Space>fo` | 🕒 Recently opened files |

---

### 💻 LSP Operations

| Keymap | Action |
|--------|--------|
| `gd` | 📍 Go to definition |
| `gr` | 🔗 Find references |
| `K` | 📖 Hover documentation |
| `<Space>ca` | ⚡ Code actions |
| `<Space>rn` | ✏️ Rename symbol |

---

### 🪟 Buffer & Window Management

| Keymap | Action |
|--------|--------|
| `<Tab>` | ➡️ Next buffer |
| `<S-Tab>` | ⬅️ Previous buffer |
| `<Space>bd` | ❌ Close buffer |
| `<C-h/j/k/l>` | ↔️ Navigate windows |

---

### 🔀 Git Integration

| Keymap | Action |
|--------|--------|
| `<Space>gs` | 📊 Git status |
| `<Space>gc` | 📝 Git commits |
| `<Space>gb` | 🌿 Git branches |
| `[c` | ⬆️ Previous hunk |
| `]c` | ⬇️ Next hunk |

> 📚 **Full keymap reference**: `lua/user/Basics/keymaps.lua`

---

## 🎨 Customization

### 🌈 Change Theme

Edit `lua/user/UI/theme.lua`:

```lua
-- Choose from 68 preinstalled themes!
vim.cmd("colorscheme gruvbox")  -- or tokyonight, catppuccin, nord, etc.
```

---

### 🔌 Add Plugins

Edit `lua/user/Basics/plugins.lua`:

```lua
return {
  {
    "author/plugin-name",
    config = function()
      require("plugin-name").setup({})
    end
  }
}
```

Then run `:Lazy sync`

---

### ⌨️ Modify Keymaps

Edit `lua/user/Basics/keymaps.lua`:

```lua
local map = vim.keymap.set

map("n", "<your-key>", "<your-command>", { desc = "Description" })
```

> 💡 **Pro tip**: Use `wk.add{}` for which-key integration. Check `Inbuilt/` for helper functions.

---

## 🐛 Troubleshooting

<details>
<summary><b>❄️ ArchVim freezes on first launch</b></summary>

**Normal behavior** during plugin installation, especially on slower devices.

**Solution**: Wait 2-5 minutes. If stuck, restart Neovim and run `:Lazy restore`

</details>

<details>
<summary><b>🔴 LSP not working</b></summary>

**Check these steps:**
1. Verify LSP installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View logs: `:LspLog`
4. Restart LSP: `:LspRestart`

</details>

<details>
<summary><b>🔣 Icons not displaying</b></summary>

**Cause**: Terminal not using a Nerd Font

**Solution**: Configure your terminal to use a font from `lua/user/Fonts/`

</details>

<details>
<summary><b>⚠️ Plugins not loading</b></summary>

**Try these fixes:**
1. Run `:Lazy check`
2. Update plugins: `:Lazy update`
3. Nuclear option: Delete `~/.local/share/nvim` and restart Neovim

</details>

---

## 🤝 Contributing

We love contributions! Here's how to help:

### 🐞 Report Issues

Open an issue with:
- ✅ ArchVim version
- ✅ Neovim version (`nvim --version`)
- ✅ Steps to reproduce
- ✅ Expected vs actual behavior

---

### 🔨 Submit Changes

1. Fork the repository
2. Create branch: `git checkout -b feature-name`
3. Make changes
4. Test thoroughly
5. Create release package:

```bash
cd ~/.config/nvim
zip -r ~/ArchVim.zip ./*
```

6. Submit pull request with:
   - Clear description
   - Rationale for changes
   - Testing details

> 📧 **Important**: Contact the maintainer before major changes to discuss approach.

---

## 📚 Documentation

| Resource | Description |
|----------|-------------|
| **[Quick Start](lua/user/Read/)** | Get started in 5 minutes |
| **[Keybindings](lua/user/Basics/keymaps.lua)** | Complete keymap reference |
| **[Plugin Docs](lua/user/config/)** | Individual plugin configurations |
| **[Troubleshooting](lua/user/Read/)** | Common issues & solutions |

---

## 🙏 Acknowledgments

ArchVim stands on the shoulders of giants:

- [**Neovim**](https://neovim.io/) - The hyperextensible editor
- [**Lazy.nvim**](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [**Mason.nvim**](https://github.com/williamboman/mason.nvim) - LSP/DAP installer
- [**Telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [**Treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax magic
- **The entire Neovim community** - For endless inspiration

---

## 📜 License

**GNU General Public License v3.0** • [View License](LICENSE)

```
Copyright (C) 2024 ArchVim Contributors

Free software: redistribute and/or modify under GPLv3 terms.
This program comes with ABSOLUTELY NO WARRANTY.
```

---

<div align="center">

## 🌟 Star History

**If ArchVim makes your life easier, give us a star!** ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=Vishnu-yes/ArchVim&type=Date)](https://star-history.com/#Vishnu-yes/ArchVim&Date)

---

### 💖 Made with Love & Lua

**[🐛 Report Bug](https://github.com/Vishnu-yes/ArchVim/issues)** • **[✨ Request Feature](https://github.com/Vishnu-yes/ArchVim/issues)** • **[💬 Discussions](https://github.com/Vishnu-yes/ArchVim/discussions)**

---

<p align="center">
  <i>Empowering developers, one keystroke at a time.</i>
</p>

<p align="center">
  <a href="https://github.com/Vishnu-yes">
    <img src="https://img.shields.io/github/followers/Vishnu-yes?style=social" alt="GitHub followers">
  </a>
</p>

</div>
