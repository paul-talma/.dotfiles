local opts = { noremap = true, silent = false }
local map = vim.keymap.set

-- cycle through autocompletions with <c-j> <c-k>
map("i", "<c-j>", "<c-n>", opts)
map("i", "<c-k>", "<c-p>", opts)

-- show diagnostic hover with <leader>dd
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic hover" })

-- rename with <leader>rn
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol under cursor" })

-- go to definition with gd
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
