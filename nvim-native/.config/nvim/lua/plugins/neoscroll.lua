return {
    deps = {
        'https://github.com/karb94/neoscroll.nvim',
    },
    setup = function()
        require('neoscroll').setup({
            mappings = {
                '<C-u>', '<C-d>',
                '<C-b>', '<C-f>',
                '<C-y>', '<C-e>',
                'zt',    'zz',    'zb',
            },
            hide_cursor = true,
            stop_eof = true,
            easing = 'quadratic',
        })
    end,
}
