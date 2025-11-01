local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- prevent config crash on startup
local ok, lazy = pcall(require, "lazy")
if not ok then
  vim.notify("lazy.nvim failed to load!", vim.log.levels.ERROR)
  return
end

lazy.setup("gaaj.lazy", {
  spec = "gaaj.lazy",
    change_detection = { notify = false }
})
