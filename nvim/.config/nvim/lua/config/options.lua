local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- splits
opt.splitbelow = true
opt.splitright = true

-- undo / backup
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false

-- performance
opt.updatetime = 250
opt.timeoutlen = 300

-- clipboard
opt.clipboard = "unnamedplus"

-- completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- fill chars
-- opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- misc
opt.mouse = "a"
opt.showmode = false
opt.breakindent = true
opt.linebreak = true
opt.confirm = true
opt.conceallevel = 0
opt.pumheight = 10
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- grep
opt.grepprg = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m"
