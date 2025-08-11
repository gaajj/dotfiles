return {
	src = "https://github.com/windwp/nvim-autopairs",
	name = "nvim-autopairs",
	setup = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true,
			fast_wrap = {
				map = "<M-e>",
			},
		})
	end,
}
