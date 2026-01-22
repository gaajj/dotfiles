return {
	{
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>l',
				function()
					require('conform').format({ async = true, lsp_fallback = true })
				end,
				mode = { 'n', 'v' },
				desc = 'Format buffer',
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				json = { 'prettier' },
				markdown = { 'prettier' },
				ron = { 'fmtron' },
				groovy = { 'prettier' },
				java = { 'google-java-format' },
				kotlin = { 'ktlint' },
			},

			formatters = {
				fmtron = {
					command = os.getenv('HOME') .. '/.cargo/bin/fmtron',
					args = { '-d', '--input', '$FILENAME' },
					stdin = false,
				},
			},

			format_on_save = {
				lsp_fallback = true,
			},
		},
	},
}
