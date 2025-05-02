return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find files (project-wide)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recently opened files" },
    { "<leader>fs", "<cmd>Telescope live_grep<CR>",   desc = "Search text in project (live grep)" },
    { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Search word under cursor" },
    { "<leader>ft", "<cmd>TodoTelescope<CR>",         desc = "Search TODO / FIX / HACK comments" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Search help tags" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        path_display = { "smart" },
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
  end,
}
