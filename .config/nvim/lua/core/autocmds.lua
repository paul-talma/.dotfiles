local api = vim.api

-- don't autocomment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- absolute number for insert mode, relative for everything else
-- except for tex and md files
local ft_to_ignore = { "latex", "plaintex", "markdown" }
api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		local current_ft = vim.bo.filetype
		for _, ft in pairs(ft_to_ignore) do
			if current_ft == ft then
				return
			end
		end

		vim.cmd("set norelativenumber")
	end,
})

api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		local current_ft = vim.bo.filetype
		for _, ft in pairs(ft_to_ignore) do
			if current_ft == ft then
				return
			end
		end

		vim.cmd("set relativenumber")
	end,
})
-- api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber" })

-- soft wrap mode for .md files
api.nvim_create_autocmd("BufEnter", { pattern = { "*.md" }, command = "SoftWrapMode" })

-- no line number for latex or md files
api.nvim_create_autocmd("BufEnter", { pattern = { "*.md", "*.tex" }, command = "setlocal nonumber norelativenumber" })
