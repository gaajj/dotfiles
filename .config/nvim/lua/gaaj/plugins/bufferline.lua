return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant", -- "slant", "padded_slant", "thick", "thin"
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    -- Optional keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
    keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
    keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
    keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick and close buffer" })
  end,
}
