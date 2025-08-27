local m = vim.keymap.set

m("n", "<Space>", "<Nop>", { silent = true })

m("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })
m("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })

m("n", "<leader>W", "<cmd>wa<CR>", { desc = "Write all buffers" })
m("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all windows" })
