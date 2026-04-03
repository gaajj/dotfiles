return {
    deps = {
        'https://github.com/nvim-telescope/telescope.nvim',
        'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
        'https://github.com/nvim-lua/plenary.nvim',
    },
    setup = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { 'node_modules', '.git/' },
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })

        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Grep word under cursor' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Document symbols' })

        vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = 'Resume last picker' })
    end,
}
