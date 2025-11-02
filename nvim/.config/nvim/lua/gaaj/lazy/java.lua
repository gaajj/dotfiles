return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls    = require("jdtls")
    local util     = require("lspconfig.util")

    -- Project root detection (git / Maven / Gradle)
    local root_dir = util.root_pattern("gradlew", "mvnw", "pom.xml", ".git")(vim.fn.getcwd())
    if not root_dir then
      root_dir = vim.fn.getcwd()
    end

    -- A unique workspace per project (JDTLS needs this)
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    vim.fn.mkdir(workspace_dir, "p")

    -- Use Mason’s jdtls wrapper binary (simplest, cross-platform)
    local cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls", "-data", workspace_dir }

    local on_attach = function(_, bufnr)
      -- reuse your global LSP mappings style
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
      end
      -- Common LSP
      map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
      map("n", "gr", vim.lsp.buf.references, "References")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

      -- JDTLS extras
      map("n", "<leader>oi", jdtls.organize_imports, "Organize Imports")
      map("n", "<leader>tc", jdtls.test_class, "Test Class")
      map("n", "<leader>tm", jdtls.test_nearest_method, "Test Nearest")
      jdtls.setup_dap({ hotcodereplace = "auto" })
      jdtls.setup.add_commands()
    end

    -- Capabilities (nvim-cmp)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then capabilities = cmp_lsp.default_capabilities(capabilities) end

    if not vim.env.JAVA_HOME or not string.find(vim.env.JAVA_HOME or "", "21") then
      -- adjust this path to your actual JDK 21 location
      vim.env.JAVA_HOME = "/home/gaaj/.sdkman/candidates/java/current"
      vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH
    end

    jdtls.start_or_attach({
      cmd = cmd,
      root_dir = root_dir,
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        java = {
          signatureHelp = { enabled = true },
          configuration = { updateBuildConfiguration = "interactive" },
          format = { enabled = true }, -- jdtls can format Java out of the box
        },
      },
      init_options = {
        bundles = {}, -- (we’ll add debug/test bundles later for QoL)
      },
    })
  end,
}
