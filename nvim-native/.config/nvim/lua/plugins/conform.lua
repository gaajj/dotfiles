return {
	src = "https://github.com/stevearc/conform.nvim",
	name = "conform",
	setup = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ll", function()
			conform.format({
				async = true,
				lsp_fallback = true,
			})
		end, { desc = "Format buffer" })
	end,
}
