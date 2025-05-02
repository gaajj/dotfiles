return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local neovim = {
      "███╗   ███╗███████╗ ██████╗ ██╗    ██╗██╗   ██╗██╗███╗   ███╗",
      "████╗ ████║██╔════╝██╔═══██╗██║    ██║██║   ██║██║████╗ ████║",
      "██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║██║   ██║██║██╔████╔██║",
      "██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    dashboard.section.header.val = neovim

    -- Menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = function()
      return "Meow meow :3"
    end

    -- Set layout + styling
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
