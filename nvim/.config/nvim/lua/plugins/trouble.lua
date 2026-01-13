return {
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = 'Trouble',
		opts = {
			focus = true,
			keys = {
				['<cr>'] = 'jump_close',
			},
		},
		keys = {
			{ '<leader>dd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics' },
			{ '<leader>dD', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Project Diagnostics' },

			{
				'[d',
				'<cmd>Trouble next skip_groups=true jump=true<cr>',
				desc = 'Next Error',
			},
			{
				']d',
				'<cmd>Trouble prev skip_groups=true jump=true<cr>',
				desc = 'Prev Error',
			},
		},
	},
}
