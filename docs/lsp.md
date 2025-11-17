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

and add new config in `~/.config/nvim/lua/leaf/plugins/lsp.lua`
like example:
```lua
vim.lsp.config("bash-language-server", {
    capabilities = capabilities, -- variable capabilities isrequire("cmp_nvim_lsp").default_capabilities()
    cmd = { vim.fn.exepath("bash-language-server"), "start" }, -- you must know how to activate the lsp, like bash-language-server activated it with "bash-language-server start" filetypes = { -- set filetypes, configuration for when lsp will be active
        "sh",
        "bash",
        "zsh",
    },
})
```

## Frequently used commands 

• `:LspInfo` - Show current LSP status
• `:LspRestart` - Restart LSP server
• `:LspStop` - Stop LSP server
• `:LspStart` - Start LSP server

## Additinoal Resource

• `:h lsp-config` - Official LSP documentation
• [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Official LSP configuration repo
