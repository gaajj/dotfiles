return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter").setup()

      -- nstall parsers
      local parsers = {
        "bash", "css", "html", "java", "javascript", "json", "jsonc",
        "lua", "luadoc", "markdown", "markdown_inline", "regex",
        "rust", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
      }
      local installed = require("nvim-treesitter").get_installed()
      local installed_set = {}
      for _, p in ipairs(installed) do
        installed_set[p] = true
      end
      local to_install = {}
      for _, p in ipairs(parsers) do
        if not installed_set[p] then
          table.insert(to_install, p)
        end
      end
      if #to_install > 0 then
        vim.cmd("TSInstall! " .. table.concat(to_install, " "))
      end

      -- textobjects config
      local ts_textobjects = require("nvim-treesitter-textobjects")
      ts_textobjects.setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      -- select keymaps
      local select = require("nvim-treesitter-textobjects.select")
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query)
        end, { desc = key:sub(1, 1) == "a" and "Around " or "Inside " .. query:match("@(.+)%.") })
      end

      -- move keymaps
      local move = require("nvim-treesitter-textobjects.move")
      local next_start = {
        ["]f"] = { "@function.outer", "Next function" },
        ["]c"] = { "@class.outer", "Next class" },
        ["]a"] = { "@parameter.outer", "Next argument" },
      }
      local prev_start = {
        ["[f"] = { "@function.outer", "Previous function" },
        ["[c"] = { "@class.outer", "Previous class" },
        ["[a"] = { "@parameter.outer", "Previous argument" },
      }
      for key, val in pairs(next_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_start(val[1])
        end, { desc = val[2] })
      end
      for key, val in pairs(prev_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_start(val[1])
        end, { desc = val[2] })
      end

      -- swap keymaps
      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>sn", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap with next argument" })
      vim.keymap.set("n", "<leader>sp", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap with previous argument" })
    end,
  },
}
