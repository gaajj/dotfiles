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

    -- Dubug stuff ---------------------------

    local bundles = {}
    local function glob(p) return vim.split(vim.fn.glob(p), "\n", { trimempty = true }) end

    local ok_mr, mason_registry = pcall(require, "mason-registry")
    local function pkg_install_path(name)
      if not ok_mr then return nil end
      if not mason_registry.has_package(name) then return nil end
      local pkg = mason_registry.get_package(name)
      if not pkg then return nil end
      -- Support both API shapes
      if type(pkg.get_install_path) == "function" then
        return pkg:get_install_path()
      end
      return pkg.install_path
    end

    local debug_path = pkg_install_path("java-debug-adapter")
    if debug_path then
      for _, jar in ipairs(glob(debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")) do
        table.insert(bundles, jar)
      end
    end

    local test_path = pkg_install_path("java-test")
    if test_path then
      for _, jar in ipairs(glob(test_path .. "/extension/server/*.jar")) do
        table.insert(bundles, jar)
      end
    end

    -- -----------------------------------------

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
      vim.env.JAVA_HOME = "/home/gaaj/.sdkman/candidates/java/21.0.9-zulu"
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
          format = { enabled = true },
        },
      },
      init_options = {
        bundles = bundles,
      },
    })
  end,
}
