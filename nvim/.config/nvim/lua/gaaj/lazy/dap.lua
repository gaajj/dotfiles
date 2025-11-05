return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>dn", function() require("dap").continue() end,          desc = "DAP Continue/Start" },
    { "<leader>do", function() require("dap").step_over() end,         desc = "DAP Step Over" },
    { "<leader>di", function() require("dap").step_into() end,         desc = "DAP Step Into" },
    { "<leader>dp", function() require("dap").step_out() end,          desc = "DAP Step Out" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP Toggle Breakpoint" },
    {
      "<leader>dB",
      function()
        vim.ui.input({ prompt = "Breakpoint condition: " }, function(cond)
          if cond then require("dap").set_breakpoint(cond) end
        end)
      end,
      desc = "DAP Conditional Breakpoint"
    },
    { "<leader>dl", function() require("dap").run_last() end,  desc = "DAP Run Last" },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP REPL" },
    { "<leader>dx", function() require("dap").terminate() end, desc = "DAP Terminate" },
  },
  config = function()
    local dap = require("dap")

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapLogPoint", { text = "◇", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticHint" })
  end,
}
