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
					['<C-u>'] = 'preview-page-up',
					['<C-d>'] = 'preview-page-down',
				},
				fzf = {
					['ctrl-u'] = 'preview-page-up',
					['ctrl-d'] = 'preview-page-down',
					['ctrl-q'] = 'select-all+accept',
					['ctrl-e'] = 'abort',
				},
			},
			git = {
				status = {
					actions = {
						['ctrl-l'] = {
							fn = function(...)
								require('fzf-lua.actions').git_unstage(...)
							end,
							reload = true,
						},
						['ctrl-h'] = {
							fn = function(...)
								require('fzf-lua.actions').git_stage(...)
							end,
							reload = true,
						},
						['ctrl-c'] = {
							fn = function()
								vim.cmd('Git commit')
							end,
							reload = false,
						},
					},
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

			{ '<leader>gl', '<cmd>FzfLua git_commits<cr>', desc = 'Git Log (fzf)' },
			{ '<leader>gs', '<cmd>FzfLua git_status<cr>', desc = 'Git Status (fzf)' },
		},
	},
}
