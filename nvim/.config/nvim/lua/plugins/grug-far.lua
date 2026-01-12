return {
	{
		'magicduck/grug-far.nvim',
		opts = { headerMaxWidth = 80 },
		cmd = 'GrugFar',
		keys = {
			{
				'<leader>sr',
				function()
					local grug = require('grug-far')
					local ext = vim.bo.filetype

					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
						},
					})
				end,
				mode = { 'n', 'v' },
				desc = 'Search and Replace',
			},
		},
	},
}
