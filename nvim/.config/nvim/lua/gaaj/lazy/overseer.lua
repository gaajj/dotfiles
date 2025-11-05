return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      strategy = {
        "terminal",
        direction = "horizontal", -- horizontal split
        open_on_start = true,     -- open terminal when task starts
        close_on_exit = false,
      },
      task_list = { direction = "bottom" },
    })

    -- Utils ---------------------------------------------------------------
    local JDK8 = "/home/gaaj/.sdkman/candidates/java/8.0.472-zulu"

    local function gradlew_cmd()
      if vim.loop.fs_stat("./gradlew") then return "./gradlew" end
      return "gradle"
    end

    local function run_gradle(args_tbl, extra_env)
      local env = vim.tbl_extend("force", {}, extra_env or {})
      local task = overseer.new_task({
        cmd = gradlew_cmd(),
        -- add --no-daemon so Gradle doesn't try to reuse a J21 daemon
        args = vim.list_extend({ "--no-daemon" }, args_tbl or {}),
        env = env,
        components = {
          "default",
          "on_complete_notify",
          { "on_output_quickfix", open = false },
        },
        strategy = { "terminal", direction = "horizontal", open_on_start = true },
      })
      task:start()
    end
    -----------------------------------------------------------------------

    -- Keybinds ------------------------------------------------------------
    -- Common tasks
    vim.keymap.set("n", "<leader>og", function()
      run_gradle({ "runClient" }, {
        JAVA_HOME = JDK8,
        PATH = JDK8 .. "/bin:" .. vim.env.PATH,
      })
    end, { desc = "Gradle: runClient (Java 8 via Overseer)" })
    vim.keymap.set("n", "<leader>ob", function() run_gradle({ "build" }) end,
      { desc = "Gradle: build (Overseer)" })
    vim.keymap.set("n", "<leader>oT", function() run_gradle({ "test" }) end,
      { desc = "Gradle: test (Overseer)" })
    vim.keymap.set("n", "<leader>oc", function() run_gradle({ "clean" }) end,
      { desc = "Gradle: clean (Overseer)" })

    -- Prompt for any Gradle task (type e.g. "runClient --stacktrace")
    vim.keymap.set("n", "<leader>oG", function()
      vim.ui.input({ prompt = "gradle task & args: " }, function(input)
        if not input or input == "" then return end
        -- split by spaces into args (naive, but fine; refine later if you need quoting)
        local args = vim.split(input, "%s+")
        run_gradle(args)
      end)
    end, { desc = "Gradle: prompt for task (Overseer)" })

    -- Overseer UI
    vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Overseer: run template" })
    vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Overseer: toggle task list" })
    -----------------------------------------------------------------------
  end,
}
