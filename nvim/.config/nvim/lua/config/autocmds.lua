vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.java",
  callback = function()
    if vim.api.nvim_buf_line_count(0) > 1 or vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] ~= "" then
      return
    end
    local path = vim.fn.expand("%:p")
    local pkg = path:match("src/[^/]+/java/(.+)/[^/]+%.java")
    local classname = vim.fn.expand("%:t:r")
    local lines = {}
    if pkg then
      lines = { "package " .. pkg:gsub("/", ".") .. ";", "", "public class " .. classname .. " {", "    ", "}" }
    else
      lines = { "public class " .. classname .. " {", "    ", "}" }
    end
    vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
    vim.api.nvim_win_set_cursor(0, { #lines - 1, 4 })
  end,
})
