return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo", "Format", "FormatToggle" },
		keys = {
			{
				"<leader>l",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				python = { "black" },
				["_"] = {},
			},

			format_on_save = function(bufnr)
				if vim.g.conform_format_on_save_disabled then
					return nil
				end
				return { timeout_ms = 1000, lsp_fallback = true }
			end,
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
