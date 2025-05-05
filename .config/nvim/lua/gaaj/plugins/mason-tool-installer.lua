return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = "VeryLazy",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Linters
        "eslint_d",
        "pylint",
        "mypy",
        "luacheck",
        "shellcheck",
        "phpstan",
        "jsonlint",
        "yamllint",
        "hadolint",
        "markdownlint",
        "stylelint",
        "dotenv-linter",
        "gitlint",
        "clippy",

        -- Formatters
        "prettier",
        "black",
        "isort",
        "stylua",
        "php-cs-fixer",
        "shfmt",
        "rustfmt",
      },
    })
  end,
}
