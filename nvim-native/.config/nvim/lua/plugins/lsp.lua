return {
    setup = function()
        vim.lsp.enable({ 'lua_ls', 'ts_ls' })

        vim.diagnostic.config({ virtual_text = true })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
                end

                map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic')
            end,
        })
    end,
}
