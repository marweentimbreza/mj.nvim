<div align="center">
  <h1>mj.nvim</h1>

  <p>This is my Neovim configuration, it only has the basics and will continue to expand in the future..</p>

</div>

---

## ✨ Features

- **💨 Fast & Lightweight:** Optimized for quick startup and responsive performance.
- **📦 Smart Plugin Management:** Using `lazy.nvim` for declarative and efficient plugin loading.
- **💡 Intelligent Code Completion:** Full-featured autocompletion with `nvim-cmp`.
- **🧠 Integrated LSP:** Go-to-definition, diagnostics, and more via `nvim-lspconfig`.
- **🔭 Powerful Fuzzy Finding:** Find files, text, and buffers instantly with Telescope.
- **🌳 File Explorer:** A clean, minimal file tree with `nvim-tree`.
- **💅 Code Formatting & Linting:** Automatic code formatting and quality checks on save.

## ✅ Prerequisites

Before you begin, ensure your system has the following dependencies installed. This configuration is primarily tested on Debian/Ubuntu-based systems.

### 1. Neovim v0.10+

This configuration requires **Neovim version 0.10 or newer**.

- **To Install/Update:** Follow the [official Neovim installation steps](https://github.com/neovim/neovim/wiki/Installing-Neovim). The `AppImage` method is recommended for Linux users to get the latest stable version.

### 2. System Dependencies

These tools are required for plugins to function correctly.

- **Core Build Tools:** `git`, `build-essential`, `cmake`, `unzip`
- **Search Tools:** `ripgrep`, `fd-find`
- **Language Runtimes:**
  - **Node.js & `npm`**: For web development tools.
  - **Python & `venv`**: For Python tools.
  - **Go (`golang`)**: For Go development tools.
  - **`luarocks`**: For Lua modules.
- **Clipboard Tool:** `xclip`

#### All-in-One Install Command (for Debian/Ubuntu)

```bash
# Update package list and install system dependencies
sudo apt update
sudo apt install git build-essential cmake unzip ripgrep fd-find xclip luarocks python3-venv golang-go
```

#### For Arch

```
sudo pacman -Syu git base-devel cmake unzip ripgrep fd xclip python go yay
yay -S luarocks
```

#### Node.js Installation (Recommended)

Using `nvm` (Node Version Manager) is the best way to manage Node.js versions.

```bash
# Install nvm
curl -o- [https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh](https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh) | bash

# Close and reopen your terminal, then install the latest LTS Node.js version
nvm install --lts
```

### 3. Nerd Font

For icons to display correctly, you **must** install a [Nerd Font](https://www.nerdfonts.com/font-downloads) and set it as the font for your terminal emulator. `JetBrains Mono Nerd Font` is a great choice.

## 🚀 Installation

Once all prerequisites are met, you can install this configuration with a single command.

```bash
git clone [https://github.com/marweentimbreza/mj.nvim](https://github.com/marweentimbreza/mj.nvim) ~/.config/nvim && nvim
```

The first time you launch `nvim`, `lazy.nvim` will automatically install all the plugins.

## ⌨️ Keybindings

Here are some of the essential keybindings to get you started:

| Keybinding    | Action                           |
| ------------- | -------------------------------- |
| `<leader> e`  | Toggle file explorer (NvimTree)  |
| `<leader> ff` | Find files (Telescope)           |
| `<leader> fg` | Grep text in project (Telescope) |
| `<leader> fb` | Find open buffers (Telescope)    |
| `gd`          | Go to definition (LSP)           |
| `K`           | Hover documentation (LSP)        |
| `<leader> ca` | Show code actions (LSP)          |

---

<div align="center">
  <p>Made with ❤️ and lots of debugging.</p>
</div>
