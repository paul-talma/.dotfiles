return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 0
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	vim.keymap.set(
		"n",
		"<leader>tt",
		":exec &bg=='light'? 'set bg=dark' : 'set bg=light'<CR>",
		{ noremap = true, silent = true, desc = "Toggle light/dark theme" }
	),
}
