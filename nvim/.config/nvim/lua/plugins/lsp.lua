return {
  { "williamboman/mason.nvim", opts = {} },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {},
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = true,
        update_in_insert = false,
        float = { border = "rounded" },
      })

      local diag_visible = true

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local m = require("config.utils").map
          local buf = { buffer = event.buf }

          m("n", "<leader>le", vim.diagnostic.open_float, "Diagnostic float", buf)
          m("n", "<leader>lf", function() vim.lsp.buf.format() end, "Format buffer", buf)
          m("n", "<leader>lh",
            function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "Toggle inlay hints", buf)
          m("n", "<leader>lt", function()
            diag_visible = not diag_visible
            vim.diagnostic.config({ virtual_text = diag_visible, signs = diag_visible })
          end, "Toggle diagnostics", buf)
        end,
      })

      local lspconfig = require("lspconfig")
    end,
  },
}
