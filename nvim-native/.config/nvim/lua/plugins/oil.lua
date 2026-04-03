return {
    deps = {
        'https://github.com/stevearc/oil.nvim',
        'https://github.com/nvim-tree/nvim-web-devicons',
    },
    setup = function()
        require('oil').setup({
            default_file_explorer = true,
            columns = { 'icon' },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ['q'] = 'actions.close',
            },
            skip_confirm_for_simple_edits = true,
            watch_for_changes = true,
        })

        vim.keymap.set('n', '-', '<cmd>Oil<cr>')
    end,
}
