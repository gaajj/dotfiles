return {
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			indent = {
				enabled = true,
				animate = { enabled = false },
				indent = {
					char = '╎',
				},
				scope = {
					enabled = true,
					char = '│',
				},
				chunk = { enabled = false },
			},

			dashboard = { enabled = true },

			notifier = { enabled = true },

			bigfile = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},

		keys = {
			{
				'<leader>lg',
				function()
					Snacks.lazygit()
				end,
				desc = 'LazyGit',
			},
			{
				'<leader>gb',
				function()
					Snacks.git.blame_line()
				end,
				desc = 'Git Blame Line',
			},
			-- {
			-- 	'<leader>t',
			-- 	function()
			-- 		Snacks.terminal()
			-- 	end,
			-- 	desc = 'Toggle Terminal',
			-- },
		},
	},
}
