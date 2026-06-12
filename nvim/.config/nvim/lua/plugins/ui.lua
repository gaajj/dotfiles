return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd("colorscheme gruvbox")

      local c = require("gruvbox").palette
      local border_fg = vim.api.nvim_get_hl(0, { name = "FloatBorder" }).fg
      local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg

      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = normal_fg, bg = c.dark0 })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = normal_fg, bg = c.dark0 })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "Visual" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = border_fg, bg = c.dark0 })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border_fg, bg = c.dark0 })
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2d2d2d" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#504945" })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
      colors = {
        theme = {
          wave = {
            ui = {
              bg        = "#000000",
              bg_dim    = "#000000",
              bg_m3     = "#000000",
              bg_m2     = "#000000",
              bg_m1     = "#000000",
              bg_p1     = "#181820",
              bg_p2     = "#1F1F28",
              bg_gutter = "#181820",
              float     = {
                bg        = "#000000",
                bg_border = "#000000",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      -- vim.cmd("colorscheme kanagawa")
    end,
  },
}
