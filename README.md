# My Neovim Config

![Preview](./image/preview.jpg) 

by the way i not use Mason for my lsp, you can use arrow key to select
code completion and Ex command and i'am not using any neovim distro

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

- for keymaps/shortcuts see [keymaps](./docs/keymaps.md)
- about lsp see [lsp](./docs/lsp.md)

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
