# My Neovim Config

![Preview](./image/preview.jpg) 

by the way i not use Mason for my lsp, you can use arrow key to select
code completion and Ex command

# Lsp Has Been setup

- python (basedpyright)
- c/c++ (clangd)
- bash (bash-language-server)
- javascript, html, css (vscode-langservers-extracted)
- lua (lua-language-server)
- rust (rust-analyzer)

you can install lsp server using package manager or npm, like example:

```bash
npm install -g bash-language-server
```
## Requirements

Before installation, ensure you have the following installed on your Termux:

- **Neovim** (latest version recommended)
- **Git**
- **fd-find** 
- **ripgrep** 
- **Termux-API** (optional, for clipboard support)
- **Nerd Font** (optional, for icons and glyphs)

## Installation
1. **Install neovim, fd-find, ripgrep, git**
    ```bash
    pkg install neovim git fd ripgrep termux-api
    ```
    Make sure you have [Termux-api](https://f-droid.org/packages/com.termux.api/) installed,
    it will enable copy or paste from the system clipboard. If you don't want that then 
    skip the termux-api installation, and also make sure your font supports unique 
    characters so that it doesn't look strange. After that:

2. **Clone my neovim config repo**
    ```bash
    git clone https://github.com/Hydra0xetc/NeovimConfig.git ~/.config/nvim
    ```
after that launch neovim

```bash
nvim
```
wait until the installation process is complete

### Notes

- **Modes**:
  - `n`: **Normal mode**.
  - `i`: **Insert mode**.
  - `v`: **Visual mode**.
  - `x`: **Visual mode**.

## Shortcuts for Lsp

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `gd`                  | `n`      | Go to definitions                         |
| `gr`                  | `n`      | Go to references                          |
| `gD`                  | `n`      | Go to declaration                         |
| `gi`                  | `n`      | Go to implementation                      |
| `<C-k>`               | `n`      | Singature help                            |
| `<space>wa`           | `n`      | Add workspace folder                      |
| `<space>wr`           | `n`      | Remove workspace folder                   |
| `<space>rn`           | `n`      | Rename symbol                             |

## Shortcuts for Bufferline

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `H`                   | `n`      | Go to prev buffer                         |
| `L`                   | `n`      | Go to next buffer                         |
| `<space>bd`           | `n`      | Delete a buffer                           |

## Shortcuts for Telescope

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `<space><space>`      | `n`      | Telescope find file                       |
| `<space>fg`           | `n`      | Telescope live grep                       |
| `<space>fc`           | `n`      | Telescope find config                     |
| `<space>fd`           | `n`      | Telescope find diagnostis                 |
| `<space>fb`           | `n`      | Telescope find buffer                     |
| `<space>fh`           | `n`      | Telescope find help tags                  |
| `<space>fr`           | `n`      | Telescope find recent files               |
| `<space>fk`           | `n`      | Telescope find keymaps                    |
| `<space>gb`           | `n`      | Telescope find branch                     |
| `<space>td`           | `n`      | Telescope find todo comments              |

## Shortcuts for Nvim-tree

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `<space>e`            | `n`      | Toggle nvim-tree                          |
| `H`                   | `n`      | Show dotfiles                             |
| `I`                   | `n`      | Show ignored files                        |
| `d`                   | `n`      | Delete a file or directory                |
| `a`                   | `n`      | Create a file or directory                |

## Shortcuts for Flash

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `s`                   | `n`      | Trigger flash                             |

## Shortcuts for Gitsigns

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `gs`                  | `n`      | Toggle gitsigns                           |

## Shortcuts for Fugutive

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `<space>gs`           | `n`      |  Open git status in split window          |
| `<space>gd`           | `n`      |  Open git diff in split window            |

## Shortcuts for Neogen

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `<space>df`           | `n`      |  Generete funtion documentation           |
| `<space>dc`           | `n`      |  Generete class documentation             |
| `<space>dt`           | `n`      |  Generete type documentation              |
| `<space>dF`           | `n`      |  Generete file documentation              |

# Custom shortcuts

| **Keybinding**        | **Mode** | **Description**                                            |
|-----------------------|----------|------------------------------------------------------------|
| `<C-x>`               | `n`      |  Add execute permission to current file                    |
| `<C-q>`               | `n`      |  Quit file                                                 |
| `<C-s>`               | `n`      |  Save file and also auto format                            |
| `<space>w`            | `n`      |  Open floating diagnostis window                           |
| `<space>S`            | `n`      |  Substitute word under cursor                              |
| `<space>ma`           | `n`      |  Make                                                      |
| `<space>mi`           | `n`      |  Intercept-build Make                                      |
| `<space>Cr`           | `n`      |  Cargo run                                                 |
| `<space>Cb`           | `n`      |  Cargo build                                               |
| `<space>Ct`           | `n`      |  Cargo test                                                |
| `<space>tc`           | `n`      |  Toggle clipboard sync (only works if termux-api installed)|
| `<space>p`            | `x`      |  Paste without yanking deleted text                        |
| `p`                   | `v`      |  Paste without yanking selection                           |
| `>`                   | `v`      |  Indent right and reselect                                 |
| `<`                   | `v`      |  Indent left and reselect                                  |
| `J`                   | `v`      |  Move visual selection downward                            |
| `K`                   | `v`      |  Move visual selection upward                              |

## FAQ

### Q: Why not use a preconfigured Neovim distribution like LazyVim, NvChad or AstroVim etc?

**A:** There are two primary reasons:

1.  **Performance & Control:** Preconfigured distributions come with 
    many plugins I don't necessarily need, which can impact startup time 
    and overall performance. I prefer a minimal setup that I can build upon.
2.  **Understanding & Debugging:** When something is preconfigured, it's harder 
    to understand *why* something works (or doesn't work). I want to know how 
    my editor is set up so I can easily fix issues, customize behavior, and 
    understand the "magic" behind it. This is especially important in unique 
    environments like Termux.

### Q: Why not use Mason?

**A:** I've had persistent issues with its performance and reliability. 
       Lsp like `clangd` often fail to install, and its heavy reliance 
       on `pip` leads to "dependency hell" when packages need to be built from 
       source due to missing system libraries or compiler tools. I prefer to manage 
       my language servers manually for more control and stability.
