return {
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = function(_, opts)
			require("nvim-ts-autotag").setup(opts)
		end,
	},
}
