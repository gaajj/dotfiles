return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- Disable "red"/"blue" names
				RRGGBBAA = true, -- #RRGGBBAA
				rgb_fn = true, -- rgb() and rgba()
				hsl_fn = true, -- hsl() and hsla()
				css = true, -- Enable all CSS features
				css_fn = true, -- Enable all CSS *functions*
			},
		},
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},
}
