local v = vim.opt
vim.cmd("let g:netrw_banner = 0")

v.guicursor = ""
v.nu = true
v.relativenumber = true

v.tabstop = 2
v.softtabstop = 2
v.shiftwidth= 2
v.expandtab = true
v.autoindent = true
v.smartindent = true
v.wrap = false

v.swapfile = false
v.backup = false
v.undofile = true

v.incsearch = true
v.inccommand = "split"
v.ignorecase = true
v.smartcase = true

v.termguicolors = true
v.background = "dark"
v.scrolloff = 8
v.signcolumn = "yes"

v.backspace = { "start", "eol", "indent" }


v.splitright = true
v.splitbelow = true

v.isfname:append("@-@")
v.updatetime = 50
v.colorcolumn = "80"

v.clipboard:append("unnamedplus")
v.hlsearch = true
v.mouse = "a"
vim.g.editorconfig = true
