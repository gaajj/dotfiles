return {
  "folke/persistence.nvim",
  event = "VeryLazy",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize" } },
  keys = {
    { "<leader>ts", function() require("persistence").load() end,                desc = "Restore session" },
    { "<leader>tl", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
    { "<leader>td", function() require("persistence").stop() end,                desc = "Don't save session this dir" },
  },
}
