return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Set up adapter for C#
    dap.adapters.coreclr = {
      type = "executable",
      command = "/usr/bin/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch - NetCoreDbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net6.0/", "file")
        end,
      },
    }
    -- Keymaps for DAP
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<F5>", dap.continue, vim.tbl_extend("force", opts, { desc = "Start/Continue Debugging" }))
    keymap("n", "<F10>", dap.step_over, vim.tbl_extend("force", opts, { desc = "Step Over" }))
    keymap("n", "<F11>", dap.step_into, vim.tbl_extend("force", opts, { desc = "Step Into" }))
    keymap("n", "<F12>", dap.step_out, vim.tbl_extend("force", opts, { desc = "Step Out" }))
    keymap("n", "<leader>db", dap.toggle_breakpoint, vim.tbl_extend("force", opts, { desc = "Toggle Breakpoint" }))
    keymap("n", "<leader>du", dapui.toggle, vim.tbl_extend("force", opts, { desc = "Toggle DAP UI" }))
    keymap("n", "<leader>dr", dap.restart, vim.tbl_extend("force", opts, { desc = "Restart Debug Session" }))
    keymap("n", "<leader>dq", dap.terminate, vim.tbl_extend("force", opts, { desc = "Terminate Debug Session" }))
  end,
}
