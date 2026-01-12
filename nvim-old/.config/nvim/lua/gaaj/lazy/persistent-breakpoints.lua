return {
  "Weissle/persistent-breakpoints.nvim",
  dependencies = { "mfussenegger/nvim-dap" },
  event = "VeryLazy",
  config = function()
    require("persistent-breakpoints").setup({
      load_breakpoints_event = { "BufReadPost" },
    })

    local api = require("persistent-breakpoints.api")
    local map = vim.keymap.set

    map("n", "<leader>db", api.toggle_breakpoint, { desc = "Breakpoint: toggle (persistent)" })
    map("n", "<leader>dB", api.set_conditional_breakpoint, { desc = "Breakpoint: conditional (persistent)" })
    map("n", "<leader>dC", api.clear_all_breakpoints, { desc = "Breakpoint: clear all (persistent)" })
  end,
}
