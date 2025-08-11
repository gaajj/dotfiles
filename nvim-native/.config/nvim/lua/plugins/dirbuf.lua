return {
	src = "https://github.com/elihunter173/dirbuf.nvim",
	name = "dirbuf",
	setup = function()
		require("dirbuf").setup({
			sort_order = "directories_first",
			show_hidden = true,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dirbuf",
			callback = function()
				vim.keymap.set("n", "q", function()
					local alt = vim.fn.bufnr("#")
					if alt > 0 and vim.fn.buflisted(alt) == 1 then
						vim.cmd("buffer #")
					else
						vim.cmd("quit")
					end
				end, { buffer = true, silent = true })
			end,
			desc = "Go back to buffer",
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			once = true,
			callback = function()
				local argc = vim.fn.argc()
				if argc == 0 then
					vim.cmd("Dirbuf")
					return
				end
				if argc == 1 then
					local arg0 = vim.fn.argv(0)
					if vim.fn.isdirectory(arg0) == 1 then
						vim.cmd("cd " .. vim.fn.fnameescape(arg0))
						vim.cmd("enew") -- avoid replacing the message buffer
						vim.cmd("Dirbuf")
					end
				end
			end,
			desc = "Open Dirbuf on startup",
		})
	end,
}
