return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- recommended
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        autoSetHints = true,
        hover_with_actions = true,
      },
      server = {
        on_attach = function(client, bufnr)
          -- You can reuse your LSP keymaps here if needed
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  end,
}
