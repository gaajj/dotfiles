return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local max = 200 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats and stats.size > max then return end
      return { lsp_fallback = true, timeout_ms = 1500 }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "jq" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      python = { "ruff_format", "black" },
      java = { "google-java-format" },
    },
  },
  keys = {
    { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format document" },
  },
}
