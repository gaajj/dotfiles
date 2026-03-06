return {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			delay = 500,
			icons = { mappings = true },
		},
		config = function(_, opts)
			local wk = require('which-key')
			wk.setup(opts)
			wk.add({
				{ '<leader>b', group = 'debug' },
				{ '<leader>c', group = 'code' },
				{ '<leader>d', group = 'diagnostics' },
				{ '<leader>f', group = 'find' },
				{ '<leader>g', group = 'git' },
				{ '<leader>h', group = 'hunk' },
				{ '<leader>m', group = 'markdown' },
				{ '<leader>o', group = 'overseer' },
				{ '<leader>r', group = 'refactor' },
				{ '<leader>s', group = 'search' },
				{ '<leader>t', group = 'toggle/todo' },
			})
		end,
	},
}
