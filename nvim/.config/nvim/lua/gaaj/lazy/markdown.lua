return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown", "mdx" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_filetypes = { "markdown", "mdx" }

    vim.keymap.set(
      "n",
      "<leader>mp",
      "<cmd>MarkdownPreview<cr>",
      { desc = "Markdown Preview" }
    )
  end,
}
