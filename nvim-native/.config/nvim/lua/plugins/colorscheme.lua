return {
	src = "https://github.com/vague2k/vague.nvim",
	name = "vague",
	setup = function()
		require("vague").setup({})
		vim.cmd("colorscheme vague")
		vim.cmd(":hi statusline guibg=NONE")
	end,
}
