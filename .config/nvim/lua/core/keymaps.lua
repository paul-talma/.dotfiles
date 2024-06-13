-- set leader key to space
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- exit insert mode with 'jk'
map("i", "jk", "<ESC>", { desc = "Exit insert mode with 'jk'" })

-- splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- scroll lock
map("n", "<leader>sc", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle scroll lock" })

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts)
map("n", "<BS>", "ci", opts)

-- dashboard
map("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Dashboard" })

-- search current buffer
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- terminal escape
map("t", "<Esc>", "<C-\\><C-n>")
map("n", "<leader>t", "<C-w>v<cmd>terminal<CR>i", { desc = "Open terminal to the right" })

-- TODO: make better mapping
-- compile and run C++ code
-- map(
-- 	"n",
-- 	"<leader>c",
-- 	":w<CR>:!g++ -std=c++20 % -o %<.out && %<.out<CR>",
-- 	{ desc = "Compile c++ file and run if successful", noremap = true, silent = true }
-- )
