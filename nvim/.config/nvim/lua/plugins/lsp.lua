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
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require('mason-lspconfig').setup({
				-- NOTE: only LSP server names here — formatters (stylua, prettier, etc.)
				-- must be installed separately via Mason or your system package manager.
				ensure_installed = { 'lua_ls', 'jdtls', 'gradle_ls', 'groovyls', 'kotlin_language_server' },
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
						[vim.diagnostic.severity.ERROR] = ' ',
						[vim.diagnostic.severity.WARN] = ' ',
						[vim.diagnostic.severity.HINT] = ' ',
						[vim.diagnostic.severity.INFO] = ' ',
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					map('gd', vim.lsp.buf.definition, 'Go to Definition')
					map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
					map('gr', vim.lsp.buf.references, 'Go to References')
					map('gi', vim.lsp.buf.implementation, 'Go to Implementation')
					map('gy', vim.lsp.buf.type_definition, 'Go to Type Definition')
					map('K', vim.lsp.buf.hover, 'Hover Documentation')
					map('<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
					map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
				end,
			})
		end,
	},
}
