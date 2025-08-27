return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"python",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autopairs = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
