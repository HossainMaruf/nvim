vim.g.mapleader = " "

local keymap = vim.keymap.set

-- ============================ BASIC MAPPING START =================================
keymap("i", "jk", "<ESC>") -- Go to NORMAL Mode
keymap("i", "kj", "<ESC>") -- Go to NORMAL Mode
keymap("n", "<leader>w", ":w<CR>") -- write in file
keymap("n", "<leader>q", ":q<CR>") -- close the window
keymap("n", "<leader>nh", ":nohl<CR>") -- clear the highlight
-- ============================ BASIC MAPPING END =================================

-- ============================ BUFFER START =================================
keymap("n", "<leader>bl", ":buffers<CR>") -- list all open buffers
keymap("n", "<leader>bt", ":tab ball<CR>") -- edit all buffers as tabs
keymap("n", "<leader>bw", ":vertical ball<CR>") -- edit all buffers as vertical windows
keymap("n", "<leader>bn", ":bnext<CR>") -- go to next buffer
keymap("n", "<leader>bp", ":bprevious<CR>") -- go to previous buffer
keymap("n", "<leader>bd", ":bdelete<CR>") -- delete the buffer
-- ============================ BUFFER END =================================

-- =========================== WINDOW START =================================
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h") -- move cursor to the left window
keymap("n", "<C-l>", "<C-w>l") -- move cursor to the right window
keymap("n", "<C-j>", "<C-w>j") -- move cursor to the down window
keymap("n", "<C-k>", "<C-w>k") -- move cursor to the up window
keymap("n", "<C-e>", "<C-w>=") -- make all windows equal height and width
keymap("n", "<C-x>", "<C-w>x") -- exchange current window with next one 

-- Resizing Window
keymap("n", "<M-j>", ":resize -2<CR>") -- decrease horizontal window size
keymap("n", "<M-k>", ":resize +2<CR>") -- increase horizontal window size
keymap("n", "<M-h>", ":vertical resize -2<CR>") -- decrease vertical window size
keymap("n", "<M-l>", ":vertical resize +2<CR>") -- increase vertical window size

-- Splitting Window
keymap("n", "<leader>hs", ":split<CR>") -- split window horizontally
keymap("n", "<leader>vs", ":vsplit<CR>") -- split window vertically
keymap("n", "<leader>k", ":only<CR>") -- close other windows except focused one
-- ============================ WINDOW END =================================

-- ============================ TAB START =================================
vim.o.showtabline = 2
vim.o.mouse = "a"
vim.o.tabline = "%!v:lua.MyTabLine()"

function _G.MyTabLine()
  local s = ""
  local current = vim.fn.tabpagenr()
  for i = 1, vim.fn.tabpagenr("$") do
    local is_current = (i == current)
    local hl = is_current and "%#TabLineSel#" or "%#TabLine#"
    -- highlight
    s = s .. hl
    -- CLICK: go to tab
    s = s .. "%" .. i .. "T"
    -- active buffer in tab
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local buf = buflist[winnr]
    -- filename
    local name = vim.fn.fnamemodify(vim.fn.bufname(buf), ":t")
    if name == "" then name = "[No Name]" end
    -- modified indicator
    if vim.bo[buf].modified then
      name = name .. " ●"
    end
    -- display
    s = s .. " " .. i .. ":" .. name .. " "
  end
  -- reset
  s = s .. "%#TabLineFill#%T"
  return s
end

keymap("n", "tn", ":tabnew<CR>") -- New Tab

keymap("n", "tk", ":tabnext<CR>") -- go to next tab (DEFAULT: gt)
keymap("n", "tj", ":tabprevious<CR>") -- go to previous tab (DEFAULT: gT)
keymap("n", "th", ":tabfirst<CR>") -- go to first tab
keymap("n", "tl", ":tablast<CR>") -- go to last tab
-- For go to a specific tab we can use (TabNumber-gt) command i.e 4gt, 7gt etc

keymap("n", "tmk", ":tabmove +1<CR>") -- move tab to next
keymap("n", "tmj", ":tabmove -1<CR>") -- move tab to previous
keymap("n", "tmh", ":tabmove 0<CR>") -- move tab to first position
keymap("n", "tml", ":tabmove<CR>") -- move tab to last position
keymap("n", "tm", function()
  local input = vim.fn.input("Move Tab To Index: ")
  if input == "" then return end
  vim.cmd("tabm " .. input)
end, { desc = "Move Tab (prompt)" })

keymap("n", "tc", ":tabclose<CR>") -- close the current tab and all its windows
keymap("n", "tC", ":tabonly<CR>") -- close all tabs except for the current one 
keymap("n", "tq", ":tabdo q<CR>") -- command - run the command on all tabs
-- ============================ TAB END =================================

-- ============================ TERMINAL START =================================
keymap("n", "tt", ":tabnew | terminal<CR>")
keymap("n", "<leader>th", ":split | terminal<CR>")
keymap("n", "<leader>tv", ":vsplit | terminal<CR>")
keymap("t", "<ESC>", "<C-\\><C-n>")
-- Navigate splits from terminal
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")
-- ============================ TERMINAL END =================================

-- ============================ INDENTATION START =================================
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- ============================ INDENTATION END =================================

-- ============================ DIAGNOSTIC START =================================
keymap("n", "<leader>E", vim.diagnostic.open_float) -- Show error message in floating window
keymap("n", "]e", vim.diagnostic.goto_next) -- Go to next error
keymap("n", "[e", vim.diagnostic.goto_prev) -- Go to previous error
-- ============================ DIAGNOSTIC END =================================

-- ============================ VIMGREP START =================================
keymap("n", "nn", ":cnext<CR>") -- jump to the next match
keymap("n", "np", ":cprevious<CR>") -- jump to the previous match
keymap("n", "no", ":copen<CR>") -- open a window containing the list of matches
keymap("n", "nl", ":cclose<CR>") -- close the quickfix window
-- ============================ VIMGREP END =================================
