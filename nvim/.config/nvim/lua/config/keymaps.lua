local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
map('n', '<leader>Q', '<cmd>q!<cr>', { desc = 'Force Quit' })
map('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save and Quit' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = 'Toggle Line Wrap' })

map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('v', '<A-j>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })
