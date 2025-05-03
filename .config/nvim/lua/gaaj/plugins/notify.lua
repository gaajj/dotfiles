return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "slide",
      timeout = 3000,
      background_colour = "#000000",
      render = "default",
    })

    -- Make default
    vim.notify = notify
  end,
}
