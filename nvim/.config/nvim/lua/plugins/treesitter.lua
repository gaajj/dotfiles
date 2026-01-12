return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {
			ensure_installed = {
				'bash',
				'c',
				'diff',
				'html',
				'java',
				'javascript',
				'jsdoc',
				'json',
				'jsonc',
				'lua',
				'luadoc',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'regex',
				'toml',
				'vim',
				'vimdoc',
				'xml',
				'yaml',
			},

			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					node_incremental = '<CR>',
					scope_incremental = '<TAB>',
					node_decremental = '<BS>',
				},
			},
		},
	},
}
