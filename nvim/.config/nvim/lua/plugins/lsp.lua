return {
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		build = ':MasonUpdate',
		opts = {},
	},

	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			},
		},
	},
	{ 'Bilal2453/luvit-meta', lazy = true },

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'saghen/blink.cmp',
			'nvim-java/nvim-java',
		},
		config = function()
			require('java').setup()

			local lspconfig = require('lspconfig')
			local blink = require('blink.cmp')
			local capabilities = blink.get_lsp_capabilities()

			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'stylua', 'jdtls' },
				automatic_installation = true,

				handlers = {
					function(server_name)
						lspconfig[server_name].setup({ capabilities = capabilities })
					end,

					['lua_ls'] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									completion = { callSnippet = 'Replace' },
									diagnostics = { globals = { 'vim' } },
								},
							},
						})
					end,
				},
			})

			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					source = 'if_many',
					prefix = '●',
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = ' ',
						[vim.diagnostic.severity.WARN] = ' ',
						[vim.diagnostic.severity.HINT] = ' ',
						[vim.diagnostic.severity.INFO] = ' ',
					},
				},
				underline = true,
				update_in_insert = false,
				serverity_sort = true,
			})
		end,
	},
}
