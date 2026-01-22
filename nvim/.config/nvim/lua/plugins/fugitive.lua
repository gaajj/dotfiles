return {
	{
		'tpope/vim-fugitive',
		cmd = 'Git',
		keys = {
			-- { '<leader>gs', '<cmd>Git<cr>', desc = 'Git Status' },
			{ '<leader>ga', '<cmd>Git<cr>', desc = 'Git Status' },
			{ '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git Blame' },
			{ '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git Diff' },
			-- { '<leader>gl', '<cmd>Git log<cr>', desc = 'Git Log' },
			{ '<leader>gp', '<cmd>Git push<cr>', desc = 'Git Push' },
		},
	},
}
