local o = vim.opt

o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = false

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.splitbelow = true
o.splitright = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true

o.scrolloff = 8
o.sidescrolloff = 16

o.swapfile = false
o.undofile = true

o.updatetime = 500
o.timeoutlen = 400

o.clipboard = "unnamedplus"

return o
