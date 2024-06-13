return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				-- lualine_a = {},
				lualine_b = {
					"fancy_branch",
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "  ",
							readonly = "  ",
							unnamed = "  ",
						},
					},
					{
						"fancy_diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " " },
					},
					{ "fancy_searchcount" },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"fancy_diff",
					-- "progress",
				},
				lualine_y = { "filetype" },
				lualine_z = { "progress" },
			},
		})
	end,
}
