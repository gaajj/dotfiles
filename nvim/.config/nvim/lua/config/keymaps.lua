vim.g.mapleader = " "
vim.g.maplocalleader = " "

local m = require("config.utils").map

m("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

m("v", "J", ":m '>+1<CR>gv=gv", "Move line down")
m("v", "K", ":m '<-2<CR>gv=gv", "Move line up")

m("n", "<C-h>", "<C-w>h", "Window left")
m("n", "<C-j>", "<C-w>j", "Window down")
m("n", "<C-k>", "<C-w>k", "Window up")
m("n", "<C-l>", "<C-w>l", "Window right")

m("n", "<C-d>", "<C-d>zz", "Scroll down centered")
m("n", "<C-u>", "<C-u>zz", "Scroll up centered")
m("n", "n", "nzzzv", "Next match centered")
m("n", "N", "Nzzzv", "Prev match centered")

m("v", "<", "<gv", "Indent left")
m("v", ">", ">gv", "Indent right")

m("n", "<A-h>", "<cmd>bprevious<CR>", "Prev buffer")
m("n", "<A-l>", "<cmd>bnext<CR>", "Next buffer")
m("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete buffer")

m("n", "<C-Up>", "<cmd>resize +2<CR>", "Increase height")
m("n", "<C-Down>", "<cmd>resize -2<CR>", "Decrease height")
m("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Decrease width")
m("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Increase width")
