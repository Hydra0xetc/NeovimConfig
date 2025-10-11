vim.opt.nu = true
vim.opt.rnu = true

-- vim.opt.guicursor = ""

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.inccommand = "nosplit"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 13
vim.opt.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }

-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

vim.opt.updatetime = 80
vim.opt.colorcolumn = ""

vim.opt.clipboard:append("unnamedplus")

-- vim.g.autoformat = true
vim.loader.enable()

-- vim.opt.mouse = ""

vim.opt.mousefocus = false
vim.opt.lazyredraw = true
vim.opt.shell = "zsh"
