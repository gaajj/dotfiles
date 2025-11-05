return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>dv", "<cmd>DapVirtualTextToggle<CR>", desc = "DAP Virtual Text Toggle" },
  },
  config = function()
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = true,
      show_stop_reason = true,
      commented = false,
      virt_text_pos = "eol",
      all_frames = false,
      virt_lines = false,
    })
  end,
}
