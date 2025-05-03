return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "bash",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
      "c_sharp",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects"
  }
}

