local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.termguicolors = true
opt.cmdheight = 0

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 10
opt.sidescrolloff = 10

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'

opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.swapfile = false
opt.mouse = 'a'
opt.updatetime = 250

vim.filetype.add({
	extension = {
		ron = 'ron',
	},
})
