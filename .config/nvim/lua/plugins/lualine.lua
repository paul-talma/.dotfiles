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
				lualine_b = { "fancy_branch" },
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "  ",
							readonly = "  ",
							unnamed = "  ",
						},
						-- color = function()
						-- 	if modified then
						-- 		return "green"
						-- 	end
						-- end
					},
					{ "fancy_diff" },
					{ "fancy_searchcount" },
				},
				lualine_x = {
					{
						"fancy_diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						-- symbols = { error = " ", warn = " ", info = " " },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "filetype" },
				lualine_z = { "progress" },
			},
		})
	end,
}
