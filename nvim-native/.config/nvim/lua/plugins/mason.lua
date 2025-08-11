return {
	src = "https://github.com/williamboman/mason.nvim",
	name = "mason",
	setup = function()
		require("mason").setup({
			ui = { border = "rounded" },
		})
	end,
}
