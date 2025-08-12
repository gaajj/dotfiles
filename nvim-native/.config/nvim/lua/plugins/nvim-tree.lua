return {
	src = "https://github.com/nvim-tree/nvim-tree.lua",
	name = "nvim-tree",
	setup = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
				highlight_git = true,
				highlight_opened_files = "all",
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
	end,
}
