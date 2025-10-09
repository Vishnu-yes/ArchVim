<div align="center">

# 🚀 ArchVim

<p align="center">
  <img src="https://img.shields.io/badge/ArchVim-Neovim-blue?style=for-the-badge&logo=neovim" alt="ArchVim">
  <img src="https://img.shields.io/badge/License-GPLv3-green?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Made%20with-Lua-FFDD00?style=for-the-badge&logo=lua" alt="Lua">
  <img src="https://img.shields.io/badge/Version-0.3.5-orange?style=for-the-badge" alt="Version">
</p>

### ⚡ A Complete IDE Experience in Your Terminal

#### Transform Neovim into a powerful development environment with near-instant startup times

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

**ArchVim** is a carefully crafted Neovim configuration that delivers a complete IDE experience while maintaining the speed and elegance of a terminal editor. Built with Lua and optimized for all architectures, ArchVim is perfect for developers who code anywhere—from desktop workstations to mobile devices via Termux.

> 💡 **"Full IDE functionality with just commands and your spacebar"**

**Key Philosophy:**
- 🎨 Beautiful and intuitive by default
- ⚡ Lightning-fast performance (~6MB footprint)
- 🌍 Write code anywhere, anytime—even on your phone
- 🔧 Fully customizable to match your workflow
- 🚀 Production-ready out of the box

---

## ✨ Features

<table>
<tr>
<td width="50%" valign="top">

### 🎨 **Modern Interface**
- Beautiful dashboard with quick actions
- Intelligent statusline & bufferline
- Smooth notification system
- Visual Git integration
- Gruvbox Dark Hard + 67 themes
- Nerd Fonts included

</td>
<td width="50%" valign="top">

### ⚡ **Blazing Performance**
- ~6 MB total footprint
- Lazy-loaded plugins for instant startup
- Pre-configured LSP servers
- Treesitter syntax highlighting
- Telescope fuzzy finding
- Automatic session management

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🛠️ **Developer Experience**
- Mason for LSP/DAP/Linter management
- Intelligent code completion
- Seamless Git workflow
- Tree-based file explorer
- Integrated terminal
- Snippet expansion support

</td>
<td width="50%" valign="top">

### 🌍 **Universal Compatibility**
- Full support for Linux/macOS/Windows
- Optimized for Termux (mobile coding!)
- Portable configuration
- Consistent across all platforms
- Extensive plugin ecosystem
- Architecture-agnostic

</td>
</tr>
</table>

---

## 📋 Requirements

| Component | Version | Purpose |
|-----------|---------|---------|
| **Neovim** | ≥ 0.11.4 | Core editor (required) |
| **Git** | Latest | Plugin management & version control (required) |
| **Nerd Font** | Any | Icons and glyphs (included in repo) |
| **Node.js** | ≥ 14.x | JavaScript/TypeScript LSP (optional) |
| **Python** | ≥ 3.8 | Python LSP support (optional) |

---

## 🚀 Quick Start

### One-Line Install

```bash
cd ~/.config && mkdir -p nvim && curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.5/ArchVim_v0.3.5.zip" && unzip -o ArchVim.zip -d nvim && rm ArchVim.zip && nvim
```

### Initial Setup

1. ⏱️ **Wait for plugins to install** (1-2 minutes on first launch)
2. 🔧 **Install language servers**: Run `:Mason` and select your languages
3. 🎉 **Start coding!**

> ⚠️ **Note**: First launch may take longer on slower connections or devices. This is normal.

---

## 📦 Installation

### Method 1: Replace Existing Config

**⚠️ This will replace your current Neovim configuration. Back it up first!**

```bash
# Backup your existing configuration
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)

# Create nvim directory
mkdir -p ~/.config/nvim && cd ~/.config/nvim

# Download latest release
curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.5/ArchVim_v0.3.5.zip"

# Extract and clean up
unzip -o ArchVim.zip && rm ArchVim.zip

# Launch ArchVim
nvim
```

---

### Method 2: Side-by-Side Installation

Test ArchVim without affecting your existing Neovim setup:

```bash
# Create separate directory
mkdir -p ~/.config/avim && cd ~/.config/avim

# Download latest release
curl -L -o ArchVim.zip "https://github.com/Vishnu-yes/ArchVim/releases/download/AV0.3.5/ArchVim_v0.3.5.zip"

# Extract and clean up
unzip -o ArchVim.zip && rm ArchVim.zip

# Launch with custom app name
NVIM_APPNAME=avim nvim
```

#### Create Permanent Alias

**Bash:**
```bash
echo "alias avim='NVIM_APPNAME=avim nvim'" >> ~/.bashrc
source ~/.bashrc
```

**Zsh:**
```bash
echo "alias avim='NVIM_APPNAME=avim nvim'" >> ~/.zshrc
source ~/.zshrc
```

**Fish:**
```bash
echo "alias avim='env NVIM_APPNAME=avim nvim'" >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

Now simply run `avim` to launch ArchVim!

---

### 🗑️ Complete Uninstall

Remove all ArchVim data:

```bash
# Remove configuration
rm -rf ~/.config/avim

# Remove plugin data
rm -rf ~/.local/share/avim

# Remove state files
rm -rf ~/.local/state/avim

# Remove cache
rm -rf ~/.cache/avim

# Remove alias (optional)
# Edit your shell config (~/.bashrc, ~/.zshrc, etc.) and remove the avim alias
```

---

## 🔧 First Launch

> ⏱️ **First startup takes 1-3 minutes** while plugins install automatically.

**ArchVim automatically sets up:**
- ✅ All plugins via Lazy.nvim
- ✅ Treesitter parsers for syntax highlighting
- ✅ Mason package manager
- ✅ Core configurations

**You still need to:**
- 🔧 Install LSP servers via `:Mason` (select your programming languages)
- 🎨 Optionally customize theme and keybindings

> ⚠️ **On slower devices**, Neovim may appear frozen during installation. This is normal—be patient!

---

## 📂 Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - loads all modules
├── lazy-lock.json          # Locked plugin versions
└── lua/
    └── user/
        ├── Basics/         # Core settings
        │   ├── keymaps.lua      # Keybinding definitions
        │   ├── options.lua      # Neovim options
        │   └── plugins.lua      # Plugin specifications
        ├── UI/             # User interface
        │   ├── statusline.lua   # Bottom status bar
        │   ├── bufferline.lua   # Top buffer tabs
        │   ├── dashboard.lua    # Start screen
        │   └── theme.lua        # Color scheme config
        ├── config/         # Plugin configurations
        │   ├── lsp.lua          # Language servers
        │   ├── telescope.lua    # Fuzzy finder
        │   ├── treesitter.lua   # Syntax parsing
        │   └── ...              # Other plugins
        ├── Inbuilt/        # Helper utilities
        ├── Fonts/          # Preinstalled Nerd Fonts
        └── Read/           # Documentation
```

---

## ⌨️ Keybindings

### Leader Keys

| Key | Purpose | Usage |
|-----|---------|-------|
| `<Space>` | **Primary leader** | Most commands start with Space |
| `'` | **Local leader** | Context-specific actions |

---

### 📁 File Navigation (Telescope)

| Keymap | Action | Description |
|--------|--------|-------------|
| `<Space>ff` | Find files | Search for files in your project |
| `<Space>fg` | Live grep | Search text across all files |
| `<Space>fb` | Browse buffers | Switch between open files |
| `<Space>fh` | Help tags | Search Neovim help documentation |
| `<Space>fo` | Old files | Recently opened files |
| `<Space>fw` | Current word | Search for word under cursor |

---

### 💻 LSP (Language Server) Operations

| Keymap | Action | Description |
|--------|--------|-------------|
| `gd` | Go to definition | Jump to where symbol is defined |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gr` | References | Find all references to symbol |
| `gi` | Implementation | Go to implementation |
| `K` | Hover docs | Show documentation popup |
| `<Space>ca` | Code actions | Show available code actions |
| `<Space>rn` | Rename | Rename symbol across project |
| `[d` | Previous diagnostic | Go to previous error/warning |
| `]d` | Next diagnostic | Go to next error/warning |
| `<Space>f` | Format | Format current file |

---

### 🪟 Buffer & Window Management

| Keymap | Action | Description |
|--------|--------|-------------|
| `<Tab>` | Next buffer | Switch to next open file |
| `<S-Tab>` | Previous buffer | Switch to previous open file |
| `<Space>bd` | Delete buffer | Close current file |
| `<Space>ba` | Delete all | Close all buffers |
| `<C-h>` | Left window | Move to window on the left |
| `<C-j>` | Down window | Move to window below |
| `<C-k>` | Up window | Move to window above |
| `<C-l>` | Right window | Move to window on the right |

---

### 🌳 File Explorer (Neo-tree)

| Keymap | Action | Description |
|--------|--------|-------------|
| `<Space>e` | Toggle explorer | Open/close file tree |
| `<Space>o` | Focus explorer | Jump to file tree |

**Inside Neo-tree:**
| Key | Action |
|-----|--------|
| `a` | Add file/folder |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |

---

### 🔀 Git Integration (Gitsigns)

| Keymap | Action | Description |
|--------|--------|-------------|
| `<Space>gs` | Git status | Show git status (via Telescope) |
| `<Space>gc` | Git commits | Browse commit history |
| `<Space>gb` | Git branches | Switch between branches |
| `<Space>gd` | Diff file | Show file changes |
| `[c` | Previous hunk | Jump to previous change |
| `]c` | Next hunk | Jump to next change |
| `<Space>hs` | Stage hunk | Stage current change |
| `<Space>hu` | Undo stage | Undo hunk staging |
| `<Space>hp` | Preview hunk | Preview change in popup |

---

### 💬 Code Completion (in Insert Mode)

| Keymap | Action |
|--------|--------|
| `<C-Space>` | Trigger completion |
| `<C-n>` | Next suggestion |
| `<C-p>` | Previous suggestion |
| `<CR>` | Confirm selection |
| `<C-e>` | Close completion menu |

---

### 🔍 Quick Actions

| Keymap | Action | Description |
|--------|--------|-------------|
| `<Space>w` | Save | Write current file |
| `<Space>q` | Quit | Close Neovim |
| `<Space>h` | No highlight | Clear search highlighting |
| `<Esc><Esc>` | Clear search | Alternative to clear search |

> 📚 **Full reference**: See `lua/user/Basics/keymaps.lua` for all keybindings

---

## 🎨 Customization

### 🌈 Change Color Theme

Edit `lua/user/UI/theme.lua`:

```lua
-- Choose from 68+ preinstalled themes!
vim.cmd("colorscheme gruvbox")

-- Popular alternatives:
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme nord")
-- vim.cmd("colorscheme onedark")
```

**Apply changes:** Restart Neovim or run `:source %`

---

### 🔌 Add New Plugins

Edit `lua/user/Basics/plugins.lua`:

```lua
return {
  -- Your existing plugins...
  
  -- Add new plugin
  {
    "github-username/plugin-name",
    dependencies = { "optional-dependency" }, -- if needed
    config = function()
      require("plugin-name").setup({
        -- Plugin configuration here
      })
    end,
    lazy = true, -- Load on demand (optional)
  },
}
```

**Apply changes:** 
1. Restart Neovim
2. Run `:Lazy sync` to install
3. Run `:Lazy` to manage plugins

---

### ⌨️ Customize Keybindings

Edit `lua/user/Basics/keymaps.lua`:

```lua
local map = vim.keymap.set

-- Add your custom keybindings
map("n", "<your-key>", "<command>", { desc = "What this does" })

-- Example: Map Ctrl+s to save in normal and insert mode
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })
```

> 💡 **Pro tip**: Use descriptive `desc` values—they appear in the which-key popup!

---

### ⚙️ Adjust Editor Options

Edit `lua/user/Basics/options.lua`:

```lua
local opt = vim.opt

-- Examples:
opt.relativenumber = true   -- Show relative line numbers
opt.tabstop = 4             -- Set tab width to 4 spaces
opt.expandtab = true        -- Use spaces instead of tabs
opt.wrap = false            -- Disable line wrapping
```

---

## 🐛 Troubleshooting

<details>
<summary><b>❄️ ArchVim freezes on first launch</b></summary>

**This is normal behavior** during plugin installation, especially on slower devices or connections.

**What to do:**
1. Wait 2-5 minutes without interrupting
2. If completely frozen (5+ minutes), restart Neovim
3. Run `:Lazy restore` to resume installation
4. Check `:Lazy` to see plugin installation status

**Still stuck?** Delete `~/.local/share/nvim` and restart.

</details>

<details>
<summary><b>🔴 LSP not working / No autocompletion</b></summary>

**Diagnostic steps:**

1. **Check if LSP server is installed:**
   ```
   :Mason
   ```
   Install your language's LSP (e.g., `pyright` for Python, `lua-language-server` for Lua)

2. **Check if LSP is running:**
   ```
   :LspInfo
   ```
   Should show "Client: <language-server> (id: X, attached)"

3. **View LSP logs:**
   ```
   :LspLog
   ```
   Look for error messages

4. **Restart LSP:**
   ```
   :LspRestart
   ```

5. **Ensure file type is detected:**
   ```
   :set filetype?
   ```

**Still not working?** The language server might need additional dependencies. Check Mason's log: `:Mason` → select server → press `g` for logs.

</details>

<details>
<summary><b>🔣 Icons appear as boxes or question marks</b></summary>

**Cause:** Your terminal isn't using a Nerd Font.

**Solutions:**

**Option 1: Use included fonts**
1. Navigate to `lua/user/Fonts/` in the ArchVim directory
2. Install one of the Nerd Fonts (double-click the `.ttf` file)
3. Configure your terminal to use that font

**Option 2: Download from official source**
1. Visit [Nerd Fonts](https://www.nerdfonts.com/)
2. Download any Nerd Font (recommended: JetBrainsMono Nerd Font)
3. Install and set in your terminal

**Terminal-specific guides:**
- **iTerm2 (macOS):** Preferences → Profiles → Text → Font
- **Windows Terminal:** Settings → Profiles → Appearance → Font face
- **GNOME Terminal:** Preferences → Profiles → Text → Font
- **Termux:** Long-press screen → Style → Choose font

</details>

<details>
<summary><b>⚠️ Plugins not loading or errors on startup</b></summary>

**Try these fixes in order:**

1. **Check plugin status:**
   ```
   :Lazy check
   ```

2. **Update all plugins:**
   ```
   :Lazy update
   ```

3. **Sync plugins to lockfile:**
   ```
   :Lazy restore
   ```

4. **Clear plugin cache:**
   ```bash
   rm -rf ~/.local/share/nvim
   rm -rf ~/.local/state/nvim
   ```
   Then restart Neovim (plugins will reinstall)

5. **Check for errors:**
   ```
   :messages
   ```

6. **Nuclear option (full reset):**
   ```bash
   rm -rf ~/.local/share/nvim
   rm -rf ~/.local/state/nvim
   rm -rf ~/.cache/nvim
   ```
   Restart Neovim for a fresh installation.

</details>

<details>
<summary><b>🐌 Neovim feels slow or laggy</b></summary>

**Common causes and fixes:**

1. **Too many plugins loading at startup:**
   - Edit `lua/user/Basics/plugins.lua`
   - Add `lazy = true` to plugins you don't need immediately

2. **Treesitter parsing large files:**
   - Disable Treesitter for large files: `:TSBufDisable highlight`

3. **LSP on large codebase:**
   - Some language servers struggle with large projects
   - Check `:LspInfo` and consider disabling unused servers

4. **Profile startup time:**
   ```bash
   nvim --startuptime startup.log
   ```
   Open `startup.log` to see what's slow

</details>

<details>
<summary><b>📱 Issues on Termux (Android)</b></summary>

**Common Termux problems:**

1. **Clipboard not working:**
   ```bash
   pkg install termux-api
   ```

2. **Python LSP issues:**
   ```bash
   pkg install python
   pip install python-lsp-server
   ```

3. **Node.js LSP issues:**
   ```bash
   pkg install nodejs-lts
   ```

4. **Storage permission denied:**
   ```bash
   termux-setup-storage
   ```
   Allow storage permission when prompted

5. **Font rendering issues:**
   - Use Termux:Styling from F-Droid
   - Or manually install a Nerd Font in `~/.termux/font.ttf`

</details>

<details>
<summary><b>❓ Other issues</b></summary>

**Still having problems?**

1. **Check existing issues:** [GitHub Issues](https://github.com/Vishnu-yes/ArchVim/issues)
2. **Ask the community:** [Discussions](https://github.com/Vishnu-yes/ArchVim/discussions)
3. **Report a bug:** Include:
   - ArchVim version
   - Neovim version (`:version`)
   - Operating system
   - Steps to reproduce
   - Error messages from `:messages` or `:LspLog`

</details>

---

## 🤝 Contributing

We welcome contributions! Whether you're fixing bugs, adding features, or improving documentation, your help makes ArchVim better.

### 🐞 Reporting Issues

**Before creating an issue:**
1. Search existing issues to avoid duplicates
2. Update to the latest version
3. Try troubleshooting steps above

**When reporting, include:**
- ✅ ArchVim version (`v0.3.5`)
- ✅ Neovim version (run `:version`)
- ✅ Operating system and architecture
- ✅ Detailed steps to reproduce
- ✅ Expected behavior vs actual behavior
- ✅ Relevant error messages (from `:messages` or logs)
- ✅ Screenshots/GIFs if applicable

[**→ Create an Issue**](https://github.com/Vishnu-yes/ArchVim/issues/new)

---

### 🔨 Submitting Changes

**Quick contribution guide:**

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub, then clone your fork
   git clone https://github.com/YOUR-USERNAME/ArchVim.git
   cd ArchVim
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   # or
   git checkout -b fix/bug-description
   ```

3. **Make your changes**
   - Follow existing code style
   - Test thoroughly
   - Update documentation if needed

4. **Test your changes**
   ```bash
   # Install in a test environment
   NVIM_APPNAME=archvim-test nvim
   ```

5. **Commit with clear messages**
   ```bash
   git add .
   git commit -m "Add: feature description"
   # or "Fix: bug description"
   # or "Docs: what you updated"
   ```

6. **Push and create Pull Request**
   ```bash
   git push origin feature/amazing-feature
   ```
   Then create a PR on GitHub

**PR Guidelines:**
- ✅ Clear, descriptive title
- ✅ Explain what and why (not just how)
- ✅ Reference related issues (#123)
- ✅ Include testing steps
- ✅ Update documentation
- ✅ Add screenshots for UI changes

> 💡 **For major changes**, open a discussion or issue first to align with project direction.

---

### 🎁 Creating Releases

If you're preparing a release package:

```bash
# Navigate to your ArchVim config
cd ~/.config/nvim

# Create release zip (excludes git files)
zip -r ~/ArchVim_v0.3.5.zip . -x "*.git*" -x "*.DS_Store"

# The zip is now at ~/ArchVim_v0.3.5.zip
```

---

## 📚 Documentation

| Resource | Description |
|----------|-------------|
| **[Quick Start Guide](lua/user/Read/)** | Get up and running in 5 minutes |
| **[Keybinding Reference](lua/user/Basics/keymaps.lua)** | Complete list of all shortcuts |
| **[Plugin Configurations](lua/user/config/)** | How each plugin is configured |
| **[Customization Guide](#-customization)** | Make ArchVim your own |
| **[Troubleshooting](#-troubleshooting)** | Solutions to common problems |
| **[Contributing](#-contributing)** | How to contribute |

---

## 🙏 Acknowledgments

ArchVim exists thanks to these amazing projects and communities:

### Core Technologies
- **[Neovim](https://neovim.io/)** - The hyperextensible Vim-based text editor
- **[Lua](https://www.lua.org/)** - Fast, lightweight scripting language

### Essential Plugins
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager with lazy loading
- **[Mason.nvim](https://github.com/williamboman/mason.nvim)** - Portable package manager for LSP/DAP/linters
- **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Highly extendable fuzzy finder
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and parsing
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Git integration

### UI & Experience
- **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** - Blazing fast statusline
- **[Bufferline](https://github.com/akinsho/bufferline.nvim)** - Buffer/tab line with icons
- **[Alpha-nvim](https://github.com/goolord/alpha-nvim)** - Greeter/dashboard
- **[Which-key](https://github.com/folke/which-key.nvim)** - Keybinding hints

### Special Thanks
- 🌟 **The Neovim community** - For endless innovation and support
- 🎨 **Theme creators** - For beautiful color schemes
- 💪 **All contributors** - For making ArchVim better
- 🤖 **Claude & ChatGPT** - For assistance in development

---

## 📜 License

**GNU General Public License v3.0**

[View Full License](LICENSE)

```
Copyright (C) 2024 ArchVim Contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details.
```

**In simple terms:** You're free to use, modify, and distribute ArchVim. If you distribute modified versions, they must also be open source under GPLv3.

---

<div align="center">

## 🌟 Show Your Support

**If ArchVim has improved your workflow, please consider:**

⭐ **Starring the repository** - It helps others discover ArchVim  
🐛 **Reporting issues** - Help us improve  
💬 **Sharing feedback** - Tell us what you think  
🤝 **Contributing** - Make ArchVim even better

[![Star History Chart](https://api.star-history.com/svg?repos=Vishnu-yes/ArchVim&type=Date)](https://star-history.com/#Vishnu-yes/ArchVim&Date)

---

### 💬 Get Help & Connect

**[🐛 Report Bug](https://github.com/Vishnu-yes/ArchVim/issues)** • **[✨ Request Feature](https://github.com/Vishnu-yes/ArchVim/issues/new)** • **[💬 Discussions](https://github.com/Vishnu-yes/ArchVim/discussions)**

---

<p align="center">
  <strong>Made with ❤️ and Lua</strong><br>
  <em>Empowering developers to code anywhere, anytime</em>
</p>

<p align="center">
  <a href="https://github.com/Vishnu-yes">
    <img src="https://img.shields.io/github/followers/Vishnu-yes?label=Follow&style=social" alt="GitHub followers">
  </a>
  <a href="https://github.com/Vishnu-yes/ArchVim">
    <img src="https://img.shields.io/github/stars/Vishnu-yes/ArchVim?style=social" alt="GitHub stars">
  </a>
</p>

<p align="center">
  <sub>Built for developers who refuse to compromise on speed, elegance, or functionality</sub>
</p>

</div>
