return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 2
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
