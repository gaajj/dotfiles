return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- dependencies = { "" }
  config = function()
    local wk = require("which-key")
    wk.setup({
      show_help = true,
      show_keys = true,
      plugins = {
        spelling = { enabled = true },
      },
      win = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    })

    vim.keymap.set("n", "<leader>?", function()
      wk.show({ mode = "n" })
    end, { desc = "Show all keymaps" })
  end,
}
