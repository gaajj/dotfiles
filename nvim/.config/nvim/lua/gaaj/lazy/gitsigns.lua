return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "▁" },
      topdelete    = { text = "▔" },
      changedelete = { text = "┃" },
      untracked    = { text = "┆" },
    },
    current_line_blame = false,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    local gs = require("gitsigns")
    vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
    vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
  end,
}
