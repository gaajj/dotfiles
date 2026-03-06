return {
	{
		'zaldih/themery.nvim',
		lazy = false,
		opts = {
			themes = { 'kanagawa-dragon', 'kanagawa-wave', 'tokyonight-storm', 'catppuccin-mocha', 'rose-pine' },
			livePreview = true,
		},
		keys = {
			{ '<leader>th', '<cmd>Themery<cr>', desc = 'Theme Manager' },
		},
	},

	{ 'rebelot/kanagawa.nvim', opts = { transparent = true } },
	{ 'folke/tokyonight.nvim', opts = { transparent = true, style = 'storm' } },
	{ 'catppuccin/nvim', name = 'catppuccin', opts = { transparent_background = true, flavour = 'mocha' } },
	{ 'rose-pine/neovim', name = 'rose-pine', opts = { styles = { transparency = true } } },
}
