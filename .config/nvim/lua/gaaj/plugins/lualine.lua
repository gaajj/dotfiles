return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      blue       = "#65D1FF",
      green      = "#3EFFDC",
      violet     = "#FF61EF",
      yellow     = "#FFDA7B",
      red        = "#FF4A4A",
      fg         = "#c3ccdc",
      bg         = "#112638",
      inactive   = "#2c3043",
    }

    local function mode_section(color)
      return {
        a = { bg = color, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      }
    end

    local my_theme = {
      normal   = mode_section(colors.blue),
      insert   = mode_section(colors.green),
      visual   = mode_section(colors.violet),
      command  = mode_section(colors.yellow),
      replace  = mode_section(colors.red),
      inactive = {
        a = { bg = colors.inactive, fg = colors.fg, gui = "bold" },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = colors.inactive, fg = colors.fg },
      },
    }

    lualine.setup({
      options = {
        theme = my_theme,
        section_separators = "",
        component_separators = "",
        icons_enabled = true,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}

