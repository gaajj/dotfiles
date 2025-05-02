return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "┆", -- eg: "▏" "┆" "│"
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      highlight = { "Function", "Label" },
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "lazy",
        "neo-tree",
        "Trouble",
        "markdown",
      },
    },
  },
}
