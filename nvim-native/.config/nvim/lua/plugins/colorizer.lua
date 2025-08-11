return {
	src = "https://github.com/NvChad/nvim-colorizer.lua",
	name = "colorizer",
	setup = function()
		require("colorizer").setup({
			"*",
		})
	end,
}
