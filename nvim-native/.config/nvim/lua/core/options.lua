local opt = vim.opt
local g = vim.g

-- leader
g.mapleader = ' '
g.maplocalleader = ' '

-- ui
opt.termguicolors = true
opt.cursorline = true
opt.showmode = false
opt.laststatus = 3
opt.colorcolumn = '80'
opt.list = true
opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    extends = '›',
    precedes = '‹',
}
opt.fillchars = {
    vert = '│',
    fold = ' ',
    foldopen = '',
    foldsep = ' ',
    foldclose = '',
    foldinner = ' ',
    msgsep = '‾',
    diff = '╱',
    eob = ' ',
}

-- numbers & lines
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes:1'
opt.wrap = false
opt.breakindent = true

-- splits & windows
opt.splitright = true
opt.splitbelow = true

-- scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'

-- indentation & tabs
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- completion & wildmenu
opt.completeopt = 'menu,menuone,noselect'
opt.wildmode = 'longest:full,full'

-- files & undo
opt.undofile = true
opt.swapfile = false
opt.writebackup = false

-- misc
opt.clipboard = 'unnamedplus'
opt.updatetime = 200
opt.timeoutlen = 500
opt.virtualedit = 'block'
opt.spelllang = 'en_us'
-- opt.shada = '!,"1000,<50,@100,/,s10,h'
