vim.api.nvim_create_user_command("Build", function()
  vim.cmd("w")
  vim.cmd("!dotnet build")
end, {})

vim.api.nvim_create_user_command("Run", function()
  vim.cmd("w")
  vim.cmd("terminal dotnet run")
end, {})
