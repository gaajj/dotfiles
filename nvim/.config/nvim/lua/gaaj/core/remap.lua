local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save", unpack(opts) })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit", unpack(opts) })
map("n", "<esc>", "<cmd>nohl<cr>", { desc = "Clear search", unpack(opts) })
