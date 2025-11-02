return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = "" },
      FIX = { icon = "", alt = { "FIXME", "BUG" } },
      NOTE = { icon = "" }
    },
  },
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    { "[t",         function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
    { "<leader>xt", "<cmd>TodoQuickFix<cr>",                             desc = "TODOs in quickfix" },
    { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Search TODOs" },
  },
}

-- TODO: KYS
-- TODO: KYSsasfasdf
-- NOTE: I HAVE AFGGOTS
-- TODO: KYSAaa
-- TODO: KYSasdagatttttt
-- FIX: KILLALLNIGGERS
