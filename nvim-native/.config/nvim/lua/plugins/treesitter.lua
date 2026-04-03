return {
    deps = {
        'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    setup = function()
        require('nvim-treesitter').install({
            'lua',
            'javascript',
            'typescript',
        })
    end,
}
