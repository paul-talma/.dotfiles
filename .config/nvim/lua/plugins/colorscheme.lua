return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"askfiy/visual_studio_code",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("visual_studio_code")
		end,
	},
}
