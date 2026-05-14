vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = false }
local map = vim.keymap.set

-- map jk to esc
map("i", "jk", "<ESC>", { desc = "Exit insert mode with 'jk'" })

-- map cr to ciw
map({ "n", "v" }, "<cr>", "ciw", { desc = "Change word under cursor" })

-- splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Move line on the screen rather than by line in the file
map({ "n", "v" }, "j", "gj", opts)
map({ "n", "v" }, "k", "gk", opts)

-- move selected lines in visual mode
map("v", "J", ":m '>+<CR>`<my`>mzgv`yo`z", opts)
map("v", "K", ":m '<-2<CR>`>my`<mzgv`yo`z", opts)
-- move current line in normal mode
-- overridden by tmux nav
-- map("n", "<C-j>", "<cmd>m+1<cr>")
-- map("n", "<C-k>", "<cmd>m-1<cr>")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- use U to redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- 'x' doesn't overwrite register
map("n", "x", '"_x')

-- have esc remove highlighting
map("n", "<Esc>", "<cmd>noh<CR><Esc>", opts)

-- <leader>p to toggle buffers
map("n", "<leader>p", "<CMD>b#<CR>", { desc = "Return to previous buffer" })

-- terminal escape
map("t", "<Esc>", "<C-\\><C-n>")
map({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Open terminal" })
