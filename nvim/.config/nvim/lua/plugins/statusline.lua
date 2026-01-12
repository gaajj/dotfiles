return {
	{
		'echasnovski/mini.statusline',
		event = 'VeryLazy',
		opts = {},
		config = function()
			require('mini.statusline').setup()
		end,
	},
}
