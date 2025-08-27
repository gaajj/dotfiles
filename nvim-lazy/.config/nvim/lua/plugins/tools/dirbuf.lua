return {
	{
		"elihunter173/dirbuf.nvim",
		cmd = { "Dirbuf", "DirbufSplit", "DirbufFloat" },
		keys = {
			{ "-", "<cmd>Dirbuf<CR>", desc = "Open Dirbuf (cwd)" },
		},
		opts = {},
		-- `nvim .` opens Dirbuf
		init = function()
			if vim.fn.argc() == 1 then
				local arg = vim.fn.argv(0)
				if arg and vim.fn.isdirectory(arg) == 1 then
					vim.api.nvim_create_autocmd("VimEnter", {
						once = true,
						callback = function()
							vim.cmd("Dirbuf " .. vim.fn.fnameescape(arg))
						end,
					})
				end
			end
		end,
	},
}
