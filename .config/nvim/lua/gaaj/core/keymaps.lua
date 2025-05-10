vim.g.mapleader = " "
local keymap = vim.keymap

-- Non-leader keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Leader keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- File explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- C#
keymap.set("n", "<leader>cb", ":Build<CR>", { desc = "C#: Build project" })
keymap.set("n", "<leader>cr", ":Run<CR>", { desc = "C#: Run project" })

-- RUST
vim.keymap.set("n", "<leader>rb", "<cmd>!cargo build<CR>", { desc = "Rust: Build project" })
vim.keymap.set("n", "<leader>rr", "<cmd>terminal cargo run<CR>", { desc = "Rust: Run project" })

vim.keymap.set("n", "<leader>sc", function()
  local word = vim.fn.expand("<cword>")
  local swapped = word:gsub(".", function(c)
    if c:match("%l") then
      return c:upper()
    elseif c:match("%u") then
      return c:lower()
    else
      return c
    end
  end)
  vim.cmd("normal! ciw" .. swapped)
end, { noremap = true, silent = true, desc = "Swap case of word under cursor" })
vim.keymap.set("n", "<leader>cs", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local char = line:sub(col + 1, col + 1)

  if char == "" then return end

  local swapped
  if char:match("%l") then
    swapped = char:upper()
  elseif char:match("%u") then
    swapped = char:lower()
  else
    return
  end

  local new_line = line:sub(1, col) .. swapped .. line:sub(col + 2)
  vim.api.nvim_set_current_line(new_line)
end, { noremap = true, silent = true, desc = "Swap case of character under cursor" })
