return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "folke/neodev.nvim", opts = {} }, -- optional for better Lua dev
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- LSP capabilities (autocompletion support)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Nice diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end

    -- LSP keybinds only when attached
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        local map = vim.keymap.set
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        map("n", "<leader>d", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Setup mason
    mason.setup()
    mason_lspconfig.setup()

    -- Configure all installed LSPs with default handler
    mason_lspconfig.setup_handlers({
      function(server)
        -- Skip jdtls - handled mmanually in ftplugin
        if server == "jdtls" or server == "rust_analyzer" then
          return
        end
        local opts = {
          capabilities = capabilities,
        }

        if server == "omnisharp" then
          opts.cmd = {
            "omnisharp",
            "--languageservver",
            "--hostPID",
            tostring(vim.fn.getpid()),
          }
          opts.enable_roslyn_analyzers = true
          opts.organize_imports_on_format = true
        end

        lspconfig[server].setup(opts)
      end,
    })

    -- Optional: Lua-specific setup
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })
  end,
}
