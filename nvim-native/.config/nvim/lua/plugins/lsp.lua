return {
    setup = function()
        vim.lsp.enable({ 'lua_ls', 'ts_ls' })

        vim.diagnostic.config({ virtual_text = true })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
                end

                map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
                map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
                map('n', 'gr', vim.lsp.buf.references, 'References')
                map('n', 'gI', vim.lsp.buf.implementation, 'Go to implementation')
                map('n', 'K', vim.lsp.buf.hover, 'Hover')

                map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
                map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
                map('n', '<leader>cf', function()
                    vim.lsp.buf.format({ async = true })
                end, 'Format')

                map('n', '[d', function()
                    vim.diagnostic.jump({ count = -1 })
                end, 'Previous diagnostic')
                map('n', ']d', function()
                    vim.diagnostic.jump({ count = 1 })
                end, 'Next diagnostic')
                map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic')
            end,
        })
    end,
}
