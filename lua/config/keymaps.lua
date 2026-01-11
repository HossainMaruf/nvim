vim.g.mapleader = " "

local keymap = vim.keymap.set

-- File Operations
keymap("n", "<leader>w", ":w<CR>") -- write in file
keymap("n", "<leader>q", ":q<CR>") -- close the window

-- ============================ TAB START =================================
keymap("n", "tn", ":tabnew<CR>") -- New Tab

keymap("n", "tgn", ":tabnext<CR>") -- go to next tab (DEFAULT: gt)
keymap("n", "tgp", ":tabprevious<CR>") -- go to previous tab (DEFAULT: gT)
keymap("n", "tga", ":tabfirst<CR>") -- go to first tab
keymap("n", "tge", ":tablast<CR>") -- go to last tab

keymap("n", "tmn", ":tabmove +1<CR>") -- move tab to next
keymap("n", "tmp", ":tabmove -1<CR>") -- move tab to previous
keymap("n", "tma", ":tabmove 0<CR>") -- move tab to first position
keymap("n", "tme", ":tabmove<CR>") -- move tab to last position

keymap("n", "tc", ":tabclose<CR>") -- close the current tab and all its windows
keymap("n", "tC", ":tabonly<CR>") -- close all tabs except for the current one 
keymap("n", "tq", ":tabdo q<CR>") -- command - run the command on all tabs

vim.keymap.set("n", "tm", function()
  local input = vim.fn.input("Move Tab To Index: ")
  if input == "" then return end
  vim.cmd("tabm " .. input)
end, { desc = "Move Tab (prompt)" })


-- ============================ TAB END =================================

-- Splitting window
keymap("n", "<leader>hs", ":split<CR>")
keymap("n", "<leader>vs", ":vsplit<CR>")

-- Terminal
keymap("n", "tt", ":tabnew | terminal<CR>")
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
