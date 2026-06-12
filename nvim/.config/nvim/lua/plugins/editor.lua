return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>",                            desc = "Find todos" },
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Prev todo" },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },
}
