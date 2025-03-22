local api = vim.api

-- don't autocomment new line
-- api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- do not display line numbers for md and text
api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	command = "setlocal nonumber norelativenumber",
})

-- api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		if not vim.b.disable_autoformat then
-- 			vim.cmd("FormatDisable")
-- 			vim.notify("Autoformat disabled for markdown files. Format with <space>cf")
-- 		end
-- 	end,
-- })

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

-- VimTex syntax highlighting
api.nvim_create_autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		vim.cmd("TSBufDisable highlight")
	end,
})

-- soft wrap mode for .md files
-- api.nvim_create_autocmd("FileType", { pattern = { "markdown" }, command = "SoftWrapMode" })

-- Global function to save, compile, and run code
function compile_and_run()
	-- Save the file
	vim.cmd("write")

	-- Get the file extension and name
	local filetype = vim.bo.filetype
	local filename = vim.fn.expand("%:p") -- Full path of the current file
	-- local base_filename = vim.fn.expand("%:r") -- File name without extension

	-- Check the file type
	if filetype == "c" then
		-- Compile C files, with output file name same as .c file but without extension
		local compile_cmd = "gcc " .. filename --.. " -o " .. base_filename
		local compile_output = vim.fn.system(compile_cmd)

		-- Check if compilation was successful
		if vim.v.shell_error ~= 0 then
			-- Open the buffer with the compilation errors
			vim.cmd("rightbelow vsplit")
			vim.cmd("enew") -- Create a new buffer
			vim.cmd("setlocal buftype=nofile")
			vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(compile_output, "\n"))
			return
		end

		-- Run the compiled program and capture its output
		local run_cmd = "./a.out"
		local run_output = vim.fn.system(run_cmd)

		-- Open the output in a buffer
		vim.cmd("rightbelow vsplit")
		vim.cmd("enew") -- Create a new buffer
		vim.cmd("setlocal buftype=nofile")
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(run_output, "\n"))
	elseif filetype == "cpp" then
		-- Compile C++ files, with output file name same as .cpp file but without extension
		local compile_cmd = "clang++ -Wall -std=c++20 " .. filename --.. " -o " .. base_filename
		local compile_output = vim.fn.system(compile_cmd)

		-- Check if compilation was successful
		if vim.v.shell_error ~= 0 then
			-- Open the buffer with the compilation errors
			vim.cmd("rightbelow vsplit")
			vim.cmd("enew") -- Create a new buffer
			vim.cmd("setlocal buftype=nofile")
			vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(compile_output, "\n"))
			return
		end

		-- Run the compiled program and capture its output
		local run_cmd = "./a.out"
		local run_output = vim.fn.system(run_cmd)

		-- Open the output in a buffer
		vim.cmd("rightbelow vsplit")
		vim.cmd("enew") -- Create a new buffer
		vim.cmd("setlocal buftype=nofile")
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(run_output, "\n"))
	-- Python
	elseif filetype == "python" then
		-- Run Python files and capture its output
		local run_cmd = 'python3 "' .. filename .. '"'
		local run_output = vim.fn.system(run_cmd)

		-- Open the output in a buffer
		vim.cmd("rightbelow vsplit")
		vim.cmd("enew") -- Create a new buffer
		vim.cmd("setlocal buftype=nofile")
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(run_output, "\n"))
	-- Javascript
	elseif filetype == "javascript" or filetype == "javascriptreact" then
		-- Run js file and capture output
		local run_cmd = "node " .. filename
		local run_output = vim.fn.system(run_cmd)

		-- Open output in buffer
		vim.cmd("rightbelow vsplit")
		vim.cmd("enew") -- Create a new buffer
		vim.cmd("setlocal buftype=nofile")
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(run_output, "\n"))
	-- Swift
	elseif filetype == "swift" then
		-- Run swift file and capture output
		local run_cmd = "swift " .. filename
		local run_output = vim.fn.system(run_cmd)

		-- Open output in buffer
		vim.cmd("rightbelow vsplit")
		vim.cmd("enew") -- Create a new buffer
		vim.cmd("setlocal buftype=nofile")
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(run_output, "\n"))
	end

	-- Resize the split to take up a third of the screen
	vim.cmd("vertical resize " .. math.floor(vim.o.columns / 3))
end

-- Autocommand to map <leader>cr for .c and .py files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "python", "swift" },
	callback = function()
		-- Map <leader>cr to the compile_and_run function
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>cr",
			":lua compile_and_run()<CR>",
			{ noremap = true, silent = true }
		)
	end,
})
