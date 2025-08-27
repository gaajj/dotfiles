return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fa",
				function()
					require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
				end,
				desc = "Find ALL (incl. dotfiles)",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
			{
				"<leader>fc",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), hidden = true })
				end,
				desc = "Find in config",
			},
		},
		opts = {
			defaults = {
				mappings = {
					i = { ["<C-u>"] = false, ["<C-d>"] = false },
				},
			},
			-- show dotfiles by default
			pickers = {
				find_files = { hidden = true, no_ignore = true },
			},
			-- make live_grep include hidden files but skip .git
			extensions = {},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(vim.tbl_deep_extend("force", opts, {
				defaults = {},
				pickers = {},
				-- pass --hidden to ripgrep for live_grep
				grep_previewer = {},
			}))
			-- make <leader>fg include hidden files but ignore .git
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					additional_args = function()
						return { "--hidden", "--glob", "!.git/*" }
					end,
				})
			end, { desc = "Live grep (incl. dotfiles)" })
		end,
	},
}
