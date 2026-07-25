return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          enable_clippy = true,
        },
        server = {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = true,
              check = { command = "clippy" },
              inlayHints = { enable = true },
              cargo = { allFeatures = true },
            },
          },
        },
      }
    end,
  },
}
