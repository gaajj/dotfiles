return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local max = 200 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats and stats.size > max then return end
      return { lsp_fallback = true, timeout_ms = 1500 }
    end,
    formatters_by_ft = {
      json = { "prettierd", "prettier", "jq" },
      yaml = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      java = { "google-java-format" },
      groovy = { "npm-groovy-lint" },
    }
  },
  keys = {
    { "<leader>l", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format document" },
  },
}
