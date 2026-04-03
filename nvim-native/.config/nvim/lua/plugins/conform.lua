return {
    deps = {
        'https://github.com/stevearc/conform.nvim',
    },
    setup = function()
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                json = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })
    end,
}
