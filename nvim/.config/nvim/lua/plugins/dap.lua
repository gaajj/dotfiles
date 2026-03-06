return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'nvim-neotest/nvim-nio',
			{
				'rcarriga/nvim-dap-ui',
				opts = {},
				config = function(_, opts)
					local dap = require('dap')
					local dapui = require('dapui')
					dapui.setup(opts)

					dap.listeners.after.event_initialized['dapui'] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated['dapui'] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited['dapui'] = function()
						dapui.close()
					end
				end,
			},
		},

		keys = {
			-- TODO: set actual binds when i do decide to use breaking points
			{
				'<F5>',
				function()
					require('dap').continue()
				end,
				desc = 'DAP: Continue',
			},
			{
				'<F10>',
				function()
					require('dap').step_over()
				end,
				desc = 'DAP: Step Over',
			},
			{
				'<F11>',
				function()
					require('dap').step_into()
				end,
				desc = 'DAP: Step Into',
			},
			{
				'<F12>',
				function()
					require('dap').step_out()
				end,
				desc = 'DAP: Step Out',
			},

			{
				'<leader>bb',
				function()
					require('dap').toggle_breakpoint()
				end,
				desc = 'Toggle Breakpoint',
			},
			{
				'<leader>bB',
				function()
					require('dap').set_breakpoint(vim.fn.input('Condition: '))
				end,
				desc = 'Conditional Breakpoint',
			},
			{
				'<leader>bl',
				function()
					require('dap').set_breakpoint(nil, nil, vim.fn.input('Log: '))
				end,
				desc = 'Log Breakpoint',
			},

			{
				'<leader>br',
				function()
					require('dap').restart()
				end,
				desc = 'Restart',
			},
			{
				'<leader>bq',
				function()
					require('dap').terminate()
				end,
				desc = 'Terminate',
			},

			{
				'<leader>bu',
				function()
					require('dapui').toggle()
				end,
				desc = 'Toggle UI',
			},
		},
	},
}
