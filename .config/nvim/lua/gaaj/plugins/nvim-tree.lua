return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Disable netrw for nvim-tree to take over
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "" }

    keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle file explorer" }))
    keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", vim.tbl_extend("force", opts, { desc = "Focus file in explorer" }))
    keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", vim.tbl_extend("force", opts, { desc = "Collapse file explorer" }))
    keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", vim.tbl_extend("force", opts, { desc = "Refresh file explorer" }))
  end,
}
