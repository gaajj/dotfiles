return {
	{
		'echasnovski/mini.pairs',
		event = 'InsertEnter',
		opts = {
			modes = { insert = true, command = true, terminal = false },
		},
	},

	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		opts = {},
	},
}
