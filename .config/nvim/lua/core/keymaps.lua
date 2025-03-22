-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = false }
local map = vim.keymap.set
-- exit insert mode with 'jk'
map("i", "jk", "<ESC>", { desc = "Exit insert mode with 'jk'" })

-- splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- delete buffer with <leader>bx
map("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Move line on the screen rather than by line in the file
map({ "n", "v" }, "j", "gj", opts)
map({ "n", "v" }, "k", "gk", opts)

-- Move up and down 5 lines at a time
map({ "n", "v" }, "J", "5gj", opts)
map({ "n", "v" }, "K", "5gk", opts)

-- join lines with <leader>j
map("n", "<leader>j", "<cmd>j<cr>", { desc = "Join line with next" })

-- scroll lock
map("n", "<leader>sc", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle scroll lock" })

-- use U to redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts)
map("v", "<CR>", "c", opts)
-- map("nv", "<BS>", "ci", opts)

-- control-backspace deletes whole word
map("i", "<M-BS>", "<ESC>ciW")
map("n", "<M-BS>", "diW")

-- 'x' doesn't overwrite register
map("n", "x", '"_x')

-- dashboard
map("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Dashboard" })

-- TODO: fix this
-- move lines
-- map("v", "K", "<cmd>m '>-2<CR>gv=gv")
-- map("v", "J", "<cmd>m '<+1<CR>gv=gv")

-- have esc remove highlighting
map("n", "<Esc>", "<cmd>noh<CR><Esc>", opts)

-- <leader>p to toggle buffers
map("n", "<leader>p", "<CMD>b#<CR>", { desc = "Return to previous buffer" })

-- terminal escape
map("t", "<Esc>", "<C-\\><C-n>")
map({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Open terminal" })
-- map("n", "<leader>t", "<C-w>v<cmd>terminal<CR>i", { desc = "Open terminal to the right" })

-- delete paragraph
map("n", "dp", "dip", { desc = "Delete paragraph" })

-- view changes
map("n", "<leader>w", "<cmd>w !diff % -<CR>", { desc = "View changes" })
