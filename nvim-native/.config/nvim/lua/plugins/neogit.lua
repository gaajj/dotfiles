return {
    deps = {
        'https://github.com/NeogitOrg/neogit',
        'https://github.com/nvim-lua/plenary.nvim',
    },
    setup = function()
        require('neogit').setup()

        vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>', { desc = 'Neogit status' })
    end,
}
