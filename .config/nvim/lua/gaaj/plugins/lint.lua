return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Fix eslint_d for .vue files
    lint.linters.eslint_d.args = {
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
      "--format",
      "json",
    }

    -- Custom cargo on_output: suppress notify for normal errors
    if lint.linters.cargo then
      lint.linters.cargo.on_output = function(_, result, ctx)
        if result.code == 101 then
          return require("lint.util").on_output_quickfix(_, result, ctx)
        elseif result.code ~= 0 then
          vim.notify("cargo lint failed with code " .. result.code, vim.log.levels.WARN)
        else
          return require("lint.util").on_output_quickfix(_, result, ctx)
        end
      end
    end

    -- Set linters per filetype
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      lua = { "luacheck" },
      python = { "pylint" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      markdown = { "markdownlint" },
      dockerfile = { "hadolint" },
      php = { "phpstan" },
      vue = { "eslint_d" },
      rust = { "clippy" },
    }

    -- Auto-run linting on save
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
