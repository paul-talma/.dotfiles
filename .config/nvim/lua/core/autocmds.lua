local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- absolute number for insert mode, relative for everything else
api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber" })
api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber" })
