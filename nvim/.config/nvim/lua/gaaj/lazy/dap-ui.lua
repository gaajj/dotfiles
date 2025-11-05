return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    { "<leader>du", function() require("dapui").toggle({}) end, desc = "DAP UI Toggle" },
    { "<leader>de", function() require("dapui").eval() end,     mode = { "n", "v" },   desc = "DAP Eval (hover/visual)" },
  },
  config = function()
    local dap   = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.65 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,         -- columns
          position = "left", -- left sidebar
        },
        {
          elements = { "repl", "console" },
          size = 10,           -- lines
          position = "bottom", -- bottom panel
        },
      },
      floating = { border = "rounded" },
      controls = { enabled = true, element = "repl" },
      render = { max_type_length = 55 },
    })

    -- Open/close UI automatically with sessions
    dap.listeners.after.event_initialized["dapui_autoopen"]  = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_autoclose"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_autoclose"]     = function() dapui.close() end
  end,
}
