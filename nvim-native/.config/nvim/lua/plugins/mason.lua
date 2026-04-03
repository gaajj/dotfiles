return {
    deps = {
        'https://github.com/mason-org/mason.nvim',
        'https://github.com/mason-org/mason-lspconfig.nvim',
    },
    setup = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'ts_ls' },
        })
    end,
}
