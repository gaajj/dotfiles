return {
    deps = {
        'https://github.com/NeogitOrg/neogit',
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/sindrets/diffview.nvim',
    },
    setup = function()
        require('neogit').setup({
            integrations = {
                diffview = true,
            },
        })

        vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>', { desc = 'Neogit status' })
    end,
}
