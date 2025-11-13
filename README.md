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

## Installation
1. **Install neovim, fd-find, ripgrep, git**
    ```bash
    apt install neovim git fd ripgrep
    ```
2. **Clone my neovim config repo**
    ```bash
    git clone https://github.com/Hydra0xetc/NeovimConfig.git ~/.config/nvim
    ```
after that launch neovim

```bash
nvim
```

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
| `gD`                  | `n`      | Go to declaration                         |
| `gi`                  | `n`      | Go to implementation                      |
| `<C-k>`               | `n`      | Singature help                            |
| `<space>wa`           | `n`      | Add workspace folder                      |
| `<space>wr`           | `n`      | remove workspace folder                   |
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
| `<space>fd`           | `n`      | Telescope find diacnostic                 |
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
| `<space>dt`           | `n`      |  Generete type documentation             |
| `<space>dF`           | `n`      |  Generete file documentation             |

# Custom shortcuts

| **Keybinding**        | **Mode** | **Description**                           |
|-----------------------|----------|-------------------------------------------|
| `<C-x>`               | `n`      |  Add execute permission to current file   |
| `<C-q>`               | `n`      |  Quit file                                |
| `<C-s>`               | `n`      |  Save file and also auto format           |
| `<space>w`            | `n`      |  Open floating diagnostis window          |
| `<space>s`            | `n`      |  Subtitute word under cursor              |
| `<space>ma`           | `n`      |  Make                                     |
| `<space>mi`           | `n`      |  Intercept-build Make                     |
| `<space>Cr`           | `n`      |  Cargo run                                |
| `<space>Cb`           | `n`      |  Cargo build                              |
| `<space>Ct`           | `n`      |  Cargo test                               |
| `<space>tc`           | `n`      |  Toggle clipboard sync                    |
| `<space>p`            | `x`      |  Paste without yanking deleted text       |
| `p`                   | `v`      |  Paste without yanking selection          |
| `>`                   | `v`      |  Indent right and reselect                |
| `<`                   | `v`      |  Indent left and reselect                 |
| `J`                   | `v`      |  Move visual selection downward           |
| `K`                   | `v`      |  Move visual selection upward             |
