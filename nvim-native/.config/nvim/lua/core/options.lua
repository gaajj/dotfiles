local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

-- ui
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes:1'
opt.cursorline = true
opt.showmode = false
opt.laststatus = 3
opt.colorcolumn = '80'
opt.wrap = false
opt.list = true
opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    extends = '›',
    precedes = '‹',
}

-- splits
opt.splitright = true
opt.splitbelow = true

-- scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'

-- indentation
opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- completion
opt.completeopt = 'menu,menuone,noselect'
opt.wildmode = 'longest:full,full'

-- files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- folding (treesitter-based)
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99

-- misc
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.updatetime = 200
