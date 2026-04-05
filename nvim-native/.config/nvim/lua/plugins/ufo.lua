return {
    deps = {
        'https://github.com/kevinhwang91/nvim-ufo',
        'https://github.com/kevinhwang91/promise-async',
    },
    setup = function()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

        vim.keymap.set('n', 'zr', function()
            require('ufo').openFoldsExceptKinds(1)
        end, { desc = 'Fold less' })

        vim.keymap.set('n', 'zm', function()
            require('ufo').closeFoldsWith(1)
        end, { desc = 'Fold more' })

        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
        })
    end,
}
