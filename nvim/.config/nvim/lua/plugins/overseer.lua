return {
	{
		'stevearc/overseer.nvim',
		cmd = { 'OverseerRun', 'OverseerToggle', 'OverseerInfo' },
		opts = {},
		config = function(_, opts)
			local overseer = require('overseer')
			overseer.setup(opts)

			local gradle_condition = {
				callback = function()
					return vim.fn.filereadable(vim.fn.getcwd() .. '/gradlew') == 1
				end,
			}

			local gradle_tasks = {
				{ 'build', 'Build' },
				{ 'test', 'Test' },
				{ 'clean', 'Clean' },
				{ 'assemble', 'Assemble' },
				{ 'check', 'Check' },
			}

			for _, entry in ipairs(gradle_tasks) do
				local task, label = entry[1], entry[2]
				overseer.register_template({
					name = 'gradle ' .. task,
					desc = label .. ' the project',
					condition = gradle_condition,
					builder = function()
						return { cmd = { './gradlew', task } }
					end,
				})
			end
		end,

		keys = {
			{ '<leader>oo', '<cmd>OverseerToggle<cr>', desc = 'Toggle Panel' },
			{ '<leader>or', '<cmd>OverseerRun<cr>', desc = 'Run Task' },

			{
				'<leader>ob',
				function()
					require('overseer').new_task({ cmd = { './gradlew', 'build' } }):start()
				end,
				desc = 'Gradle Build',
			},
			{
				'<leader>ot',
				function()
					require('overseer').new_task({ cmd = { './gradlew', 'test' } }):start()
				end,
				desc = 'Gradle Test',
			},
		},
	},
}
