return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-",         "<cmd>Oil<cr>",         desc = "Open parent directory" },
      { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open Oil (float)" },
    },
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      float = {
        padding = 2,
        max_width = 120,
        max_height = 30,
        border = "rounded",
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["?"] = "actions.show_help",
      },
    },
  }
}
