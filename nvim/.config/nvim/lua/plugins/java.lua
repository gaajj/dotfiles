return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    confgi = function()
      local jdtls = require("jdtls")
      local root = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
      local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root, ":t")

      jdtls.start_or_attach({
        cmd = { "jdtls", "--data", workspace },
        root_dit = root,
      })
    end,
  },
}
