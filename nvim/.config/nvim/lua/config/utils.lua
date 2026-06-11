local M = {}

M.map = function(mode, keys, func, desc, opts)
  vim.keymap.set(mode, keys, func, vim.tbl_extend("force", { desc = desc }, opts or {}))
end

return M
