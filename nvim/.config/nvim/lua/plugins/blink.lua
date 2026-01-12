return {
	{
		'saghen/blink.cmp',
		version = '*',
		event = 'InsertEnter',
		dependencies = { 'rafamadriz/friendly-snippets' },

		opts = {
			keymap = {
				preset = 'none',

				['<Tab>'] = { 'select_and_accept', 'fallback' },

				['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono',
			},

			completion = {
				list = { selection = { preselect = false, auto_insert = false } },
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			signature = { enabled = true },
		},
	},
}
