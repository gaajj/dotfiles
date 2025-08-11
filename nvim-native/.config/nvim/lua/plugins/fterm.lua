return {
	src = "https://github.com/numToStr/FTerm.nvim",
	name = "fterm",
	setup = function()
		local fterm = require("FTerm")

		fterm.setup({
			border = "rounded",
		})

		vim.keymap.set({ "n", "t" }, "<leader>tt", function()
			fterm.toggle()
		end, { desc = "toggle terminal" })
	end,
}
