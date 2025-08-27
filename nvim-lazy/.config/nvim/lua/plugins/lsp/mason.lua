return {
	-- Core package manager
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ui = { border = "rounded" },
		},
	},

	-- Bridge mason <-> lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",
				"jsonls",
				"yamlls",
				"html",
				"cssls",
				"pyright",
				"ts_ls",
			},
			automatic_installation = true,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"shfmt",
				"black",
			},
			run_on_start = true,
			start_delay = 0,
			auto_update = false,
		},
	},
}
