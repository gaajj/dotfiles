return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      -- find
      { "<leader>ff",       "<cmd>FzfLua files<cr>",                 desc = "Find files" },
      { "<leader>fg",       "<cmd>FzfLua live_grep<cr>",             desc = "Live grep" },
      { "<leader>fw",       "<cmd>FzfLua grep_cword<cr>",            desc = "Grep word under cursor" },
      { "<leader>fb",       "<cmd>FzfLua buffers<cr>",               desc = "Find buffers" },
      { "<leader>fh",       "<cmd>FzfLua helptags<cr>",              desc = "Find help tags" },
      { "<leader>fr",       "<cmd>FzfLua oldfiles<cr>",              desc = "Recent files" },
      { "<leader>fc",       "<cmd>FzfLua commands<cr>",              desc = "Commands" },
      { "<leader>fk",       "<cmd>FzfLua keymaps<cr>",               desc = "Keymaps" },

      -- LSP via fzf
      { "<leader>fs",       "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "Document symbols" },
      { "<leader>fS",       "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fd",       "<cmd>FzfLua diagnostics_document<cr>",  desc = "Document diagnostics" },
      { "<leader>fD",       "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },

      -- git
      { "<leader>gc",       "<cmd>FzfLua git_commits<cr>",           desc = "Git commits" },
      { "<leader>gs",       "<cmd>FzfLua git_status<cr>",            desc = "Git status" },
      { "<leader>gb",       "<cmd>FzfLua git_branches<cr>",          desc = "Git branches" },

      -- resume last search
      { "<leader><leader>", "<cmd>FzfLua resume<cr>",                desc = "Resume last search" },
    },
    opts = {
      "default-title",
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.5,
        col = 0.5,
        preview = {
          layout = "vertical",
          vertical = "down:45%",
        },
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      files = {
        cwd_prompt = false,
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case",
      },
    },
  },
}
