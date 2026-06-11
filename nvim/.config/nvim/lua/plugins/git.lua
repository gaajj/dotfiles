return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local m = require("config.utils").map
        local buf = { buffer = bufnr }

        m("n", "]h", gs.next_hunk, "Next hunk", buf)
        m("n", "[h", gs.prev_hunk, "Prev hunk", buf)
        m("n", "<leader>gs", gs.stage_hunk, "Stage hunk", buf)
        m("n", "<leader>gr", gs.reset_hunk, "Reset hunk", buf)
        m("n", "<leader>gp", gs.preview_hunk, "Preview hunk", buf)
        m("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle blame", buf)
        m("n", "<leader>gd", gs.diffthis, "Diff this", buf)
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
    },
  },
}
