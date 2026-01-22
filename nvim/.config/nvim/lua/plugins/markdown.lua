return {
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
		ft = { 'markdown' },
		build = 'cd app && npm install',
		init = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		keys = {
			{
				'<leader>mp',
				ft = 'markdown',
				'<cmd>MarkdownPreviewToggle<cr>',
				desc = 'Markdown Preview',
			},
		},
		config = function()
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_theme = 'dark'
		end,
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		ft = { 'markdown' },
		keys = {
			{
				'<leader>mt',
				'<cmd>RenderMarkdown toggle<cr>',
				desc = 'Toggle Render Markdown',
			},
		},
		opts = {},
	},
}
