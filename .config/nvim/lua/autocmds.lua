local api = vim.api
local auto = api.nvim_create_autocmd

-- highlight on yank
auto("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "vim" },
	callback = function(args)
		vim.keymap.set("n", "<cr>", "<cr>", { buffer = args.buf, remap = false })
		vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = args.buf, remap = false })
	end,
})
