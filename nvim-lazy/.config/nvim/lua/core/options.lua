vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.opt

-- UI
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.termguicolors = true
o.scrolloff = 10
o.sidescrolloff = 10

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.breakindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Behavior
o.clipboard = "unnamedplus"
o.mouse = "a"
o.timeoutlen = 400
o.splitbelow = true
o.splitright = true
o.undofile = true

-- Completion
o.completeopt = { "menuone", "noselect" }

-- Text rendering
o.wrap = true
o.conceallevel = 2
