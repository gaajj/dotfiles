return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGIt",
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.g.lazygit_use_neovim_remote = 1
  end,
}
