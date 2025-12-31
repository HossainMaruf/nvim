vim.g.mapleader = " "

local keymap = vim.keymap.set

-- File Operations
keymap("n", "<leader>w", ":w<CR>") -- write in file
keymap("n", "<leader>q", ":q<CR>") -- close the window

-- Splitting window
keymap("n", "<leader>hs", ":split<CR>")
keymap("n", "<leader>vs", ":vsplit<CR>")
keymap("n", "<leader>tn", ":tabnew<CR>")
keymap("n", "<leader>tq", ":tabclose<CR>")
keymap("n", "<leader>ti", ":tabnext<CR>")
keymap("n", "<leader>to", ":tabprev<CR>")

-- Terminal
keymap("n", "<leader>tt", ":tabnew | terminal<CR>")
keymap("n", "<leader>th", ":split | terminal<CR>")
keymap("n", "<leader>tv", ":vsplit | terminal<CR>")
keymap("t", "<ESC>", "<C-\\><C-n>")
-- Navigate splits from terminal
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- Resizing window
keymap("n", "<M-j>", ":resize -2<CR>")
keymap("n", "<M-k>", ":resize +2<CR>")
keymap("n", "<M-h>", ":vertical resize -2<CR>")
keymap("n", "<M-l>", ":vertical resize +2<CR>")

-- I hate ekscape more than anything else
keymap("i", "jk", "<ESC>")
keymap("i", "kj", "<ESC>")

-- Easy CAPS
keymap("n", "<C-u>", "viwU<ESC>")
keymap("i", "<C-u>", "<ESC>viwUi")

-- Change the buffer
keymap("n", "<TAB>", ":bnext<CR>")
keymap("n", "<S-TAB>", ":bprevious<CR>")

-- Better Tabbing
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Clear search highlight
keymap("n", "<leader>nh", ":nohl<CR>")

-- Not so essential
keymap("n", "<leader>o", "o<ESC>^Da")
keymap("n", "<leader>O", "O<ESC>^Da")

-- Show error message in floating window
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float)

-- Go to next/previous error
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
