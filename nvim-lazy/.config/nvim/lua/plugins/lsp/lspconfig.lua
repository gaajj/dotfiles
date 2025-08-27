return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", opts = {} }, -- sets up before lua_ls
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- capabilities (nvim-cmp)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if ok_cmp then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			-- on_attach: keymaps + let conform handle formatting
			local on_attach = function(client, bufnr)
				local function m(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
				m("n", "gd", vim.lsp.buf.definition, "LSP: Goto Definition")
				m("n", "gD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
				m("n", "gi", vim.lsp.buf.implementation, "LSP: Goto Implementation")
				m("n", "gr", vim.lsp.buf.references, "LSP: References")
				m("n", "K", vim.lsp.buf.hover, "LSP: Hover")
				m("n", "<leader>lr", vim.lsp.buf.rename, "LSP: Rename")
				m({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "LSP: Code Action")
				m("n", "<leader>ld", vim.diagnostic.open_float, "LSP: Line Diagnostics")
				m("n", "[d", vim.diagnostic.goto_prev, "LSP: Prev Diagnostic")
				m("n", "]d", vim.diagnostic.goto_next, "LSP: Next Diagnostic")

				if client.supports_method("textDocument/formatting") then
					client.server_capabilities.documentFormattingProvider = false
				end
				if client.supports_method("textDocument/rangeFormatting") then
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end

			vim.diagnostic.config({
				float = { border = "rounded" },
				severity_sort = true,
				virtual_text = { spacing = 2, prefix = "●" },
			})

			-- per-server opts
			local function server_opts(server)
				local opts = { capabilities = capabilities, on_attach = on_attach }
				if server == "lua_ls" then
					opts.settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					}
				elseif server == "yamlls" then
					opts.settings = { yaml = { keyOrdering = false } }
				end
				return opts
			end

			-- Wire up whatever mason installed
			if type(mason_lspconfig.setup_handlers) == "function" then
				mason_lspconfig.setup_handlers({
					function(server)
						local ok = pcall(function()
							-- guard: only setup if lspconfig knows this server
							if lspconfig[server] then
								lspconfig[server].setup(server_opts(server))
							end
						end)
						if not ok then
							vim.schedule(function()
								vim.notify("LSP setup failed for " .. server, vim.log.levels.WARN)
							end)
						end
					end,
				})
			else
				-- super-old fallback
				for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
					if lspconfig[server] then
						pcall(function()
							lspconfig[server].setup(server_opts(server))
						end)
					end
				end
			end
		end,
	},
}
