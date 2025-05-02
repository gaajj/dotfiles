return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      title_pos = "center",
      border = "rounded",
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
    },
  },
}
