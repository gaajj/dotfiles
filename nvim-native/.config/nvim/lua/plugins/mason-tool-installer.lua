return {
	src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	name = "mason-tool-installer",
	setup = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- formatters
				"stylua",

				-- lsps
				"lua-language-server",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
