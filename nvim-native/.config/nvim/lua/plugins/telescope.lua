return {
	src = "https://github.com/nvim-telescope/telescope.nvim",
	name = "telescope",
	setup = function()
		require("telescope").setup({})
		local map = vim.keymap.set
		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
	end,
}
