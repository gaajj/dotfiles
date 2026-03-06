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

			{ ']d', '<cmd>Trouble diagnostics next skip_groups=true jump=true<cr>', desc = 'Next Diagnostic' },
			{ '[d', '<cmd>Trouble diagnostics prev skip_groups=true jump=true<cr>', desc = 'Prev Diagnostic' },
		},
	},
}
