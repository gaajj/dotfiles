local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

-- clear search hl
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- ---------------------------------------
-- navigation
-- ---------------------------------------
-- window nav
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- resize windows
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- buffer nav
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- tab nav
map('n', '<leader><tab>l', '<cmd>tablast<CR>', { desc = 'Last tab' })
map('n', '<leader><tab>f', '<cmd>tabfirst<CR>', { desc = 'First tab' })
map('n', '<leader><tab>n', '<cmd>tabnew<CR>', { desc = 'New tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<CR>', { desc = 'Next tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<CR>', { desc = 'Close tab' })

-- ---------------------------------------
-- editing
-- ---------------------------------------
-- better indenting
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- move lines up/down
map('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- better paste
map('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- delete without yanking
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- keep cursor centered when scrolling
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- keep search centered
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- ---------------------------------------
-- splits
-- ---------------------------------------
map('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split horizontal' })
map('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split vertical' })

-- ---------------------------------------
-- file operations
-- ---------------------------------------
map('n', '<leader>ss', '<cmd>source %<CR>', { desc = 'Source current file' })
map('n', '<leader>sx', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable', silent = true })

-- ---------------------------------------
-- quickfix
-- ---------------------------------------
map('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous quickfix' })
map('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
map('n', '<leader>qo', '<cmd>copen<CR>', { desc = 'Open quickfix' })
map('n', '<leader>qc', '<cmd>cclose<CR>', { desc = 'Close quickfix' })

-- ---------------------------------------
-- terminal
-- ---------------------------------------
-- terminal mode escape
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- terminal navigation
map('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Go to left window' })
map('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Go to lower window' })
map('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Go to upper window' })
map('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Go to right window' })

-- ---------------------------------------
-- miscellaneous
-- ---------------------------------------
map('n', '<leader>tn', '<cmd>set number!<CR>', { desc = 'Toggle line numbers' })
map('n', '<leader>tr', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative numbers' })
map('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' })
map('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = 'Toggle spell check' })
