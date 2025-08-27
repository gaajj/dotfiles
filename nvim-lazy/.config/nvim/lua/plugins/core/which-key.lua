return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 300,
			plugins = { marks = true, registers = true },
			win = { border = "rounded" },
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			-- New-style group spec
			wk.add({
				{ "<leader>w", group = "write" },
				{ "<leader>q", group = "quit" },
				{ "<leader>f", group = "find" },
				{ "<leader>l", group = "lsp/format" },
			})
		end,
	},
}
