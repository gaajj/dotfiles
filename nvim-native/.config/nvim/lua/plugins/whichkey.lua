return {
    deps = {
        'https://github.com/folke/which-key.nvim',
    },
    setup = function()
        require('which-key').setup({
            preset = 'classic',
            delay = 700,
        })

        require('which-key').add({
            { '<leader>b', group = 'buffer' },
            { '<leader>c', group = 'code' },
            { '<leader>f', group = 'find' },
            { '<leader>g', group = 'git' },
            { '<leader>h', group = 'hunk' },
            { '<leader>q', group = 'quickfix' },
            { '<leader>r', group = 'refactor' },
            { '<leader>s', group = 'source' },
            { '<leader>t', group = 'toggle' },
            { '<leader><tab>', group = 'tab' },
        })
    end,
}
