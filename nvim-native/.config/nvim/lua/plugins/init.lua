local plugins = {
    'mason',
    'lsp',
    'treesitter',
    'colorscheme',
    'blink',
    'oil',
    'gitsigns',
    'neogit',
    'telescope',
    'conform',
    'whichkey',
}

for _, name in ipairs(plugins) do
    local plugin = require('plugins.' .. name)
    if plugin.deps then
        vim.pack.add(plugin.deps)
    end
    if plugin.setup then
        plugin.setup()
    end
end
