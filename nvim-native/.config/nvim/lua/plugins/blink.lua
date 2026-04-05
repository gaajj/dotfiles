return {
    deps = {
        'https://github.com/saghen/blink.cmp',
    },
    setup = function()
        require('blink.cmp').setup({
            fuzzy = { implementation = 'prefer_rust' },
            signature = { enabled = true },
            keymap = {
                preset = 'default',
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal',
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },

            cmdline = {
                keymap = {
                    preset = 'inherit',
                    ['<CR>'] = { 'accept_and_enter', 'fallback' },
                },
            },

            sources = { default = { 'lsp' } },
        })
    end,
}
