return {
	{
		'ibhagwan/fzf-lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },

		opts = {
			winopts = {
				height = 0.60,
				width = 0.60,
				row = 0.40,
				preview = {
					layout = 'flex',
				},
			},
			keymap = {
				builtin = {
					['<C-k>'] = 'preview-page-up',
					['<C-j>'] = 'preview-page-down',
				},
				fzf = {
					['ctrl-q'] = 'select-all+accept',
					['ctrl-e'] = 'abort',
				},
			},
		},

		keys = {
			{ '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files' },
			{ '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep Project' },
			{ '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Find Buffer' },
			{ '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
			{ '<leader>fs', '<cmd>FzfLua resume<cr>', desc = 'Resume Search' },
			{ '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent Files' },
			{ '<leader>fm', '<cmd>FzfLua keymaps<cr>', desc = 'Keymaps' },
		},
	},
}
