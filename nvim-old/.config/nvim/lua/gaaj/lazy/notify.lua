return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade_in_slide_out",
      timeout = 2000,
      render = "compact",
    })
    vim.notify = notify
  end,
}
