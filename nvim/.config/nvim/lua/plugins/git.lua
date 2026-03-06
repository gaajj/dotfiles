return {
	{
		'lewis6991/gitsigns.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {
			signs = {
				add = { text = '┃' },
				change = { text = '┃' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
				untracked = { text = '┆' },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					vim.keymap.set(mode, l, r, vim.tbl_extend('force', { buffer = bufnr }, opts or {}))
				end

				map('n', ']h', function()
					if vim.wo.diff then
						return ']h'
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, desc = 'Next Hunk' })

				map('n', '[h', function()
					if vim.wo.diff then
						return '[h'
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, desc = 'Prev Hunk' })

				map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
				map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
				map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
				map('n', '<leader>hb', function()
					gs.blame_line({ full = true })
				end, { desc = 'Blame Line' })
				map('n', '<leader>hd', gs.diffthis, { desc = 'Diff This' })
			end,
		},
	},

	{
		'tpope/vim-fugitive',
		cmd = 'Git',
		keys = {
			{ '<leader>ga', '<cmd>Git<cr>', desc = 'Git Status' },
			{ '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git Blame' },
			{ '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git Diff' },
			{ '<leader>gp', '<cmd>Git push<cr>', desc = 'Git Push' },
		},
	},
}
