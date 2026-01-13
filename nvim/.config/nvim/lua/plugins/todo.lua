return {
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
		keys = {
			{
				']t',
				function()
					require('todo-comments').jump_next()
				end,
				desc = 'Next Todo',
			},
			{
				'[t',
				function()
					require('todo-comments').jump_prev()
				end,
				desc = 'Previous Todo',
			},

			{ '<leader>tt', '<cmd>TodoTrouble<cr>', desc = 'Todo (Trouble)' },
		},
	},
}
