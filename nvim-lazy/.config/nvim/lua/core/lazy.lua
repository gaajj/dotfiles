local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins.core" },
		{ import = "plugins.edit" },
		{ import = "plugins.tools" },
		{ import = "plugins.lsp" },
	},
	defaults = { lazy = false, version = nil },
	install = { colorscheme = { "tokyonight", "catppuccin", "habamax" } },
	checker = { enabled = true },
	change_detection = { enabled = true, notify = false },
	ui = { border = "rounded" },
})
