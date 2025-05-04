local jdtls = require("jdtls")

-- Get project root (looks for build.gradle, pom.xml, or .git)
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then
  return
end

-- Set workspace directory per project
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- Setup command to launch jdtls
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

local config = {
  cmd = {
    jdtls_path .. "/bin/jdtls",
    "--jvm-arg=-javaagent:" .. jdtls_path .. "/lombok.jar",
    "-configuration",
    jdtls_path .. "/config_linux",
    "-data",
    workspace_dir,
  },

  root_dir = root_dir,
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
      },
    },
  },
  init_options = {
    bundles = {}, -- Will be used for DAP later
  },
}

jdtls.start_or_attach(config)

-- Add useful LSP commands for Java

-- Enable code lens auto-refresh
local function enable_codelens_refresh()
  local group = vim.api.nvim_create_augroup("jdtls_codelens", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
    group = group,
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  })
end
enable_codelens_refresh()

-- Buffer-local keymaps for jdtls features
local bufopts = { noremap = true, silent = true, buffer = true }
local keymap = vim.keymap.set

-- CodeLens actions
keymap("n", "<leader>jc", vim.lsp.codelens.run, vim.tbl_extend("force", bufopts, { desc = "Run CodeLens actions" }))

-- Organize imports
keymap("n", "<leader>ji", function()
  vim.lsp.buf.execute_command({
    command = "java.edit.organizeImports",
    arguments = { vim.uri_from_bufnr(0) },
  })
end, vim.tbl_extend("force", bufopts, { desc = "Organize Imports" }))

-- Update project config
keymap("n", "<leader>ju", "<cmd>JdtUpdateConfig<CR>", vim.tbl_extend("force", bufopts, { desc = "Update JDT config" }))
