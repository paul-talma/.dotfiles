return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"meuter/lualine-so-fancy.nvim",
	},

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

				lualine_a = {
					{ "mode" },
				},

				lualine_b = {
					{ "fancy_branch" },
				},

				lualine_c = {
					-- {
					-- 	"fancy_cwd",
					-- 	symbols = {
					-- 		modified = "  ",
					-- 		readonly = "  ",
					-- 		unnamed = "  ",
					-- 	},
					-- },
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
				},

				lualine_x = {
					{ "fancy_macro" },
					{
						"fancy_diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{ "fancy_searchcount" },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},

				lualine_y = {
					-- { "fancy_location" },
					{ "progress" },
				},

				lualine_z = {
					{ "fancy_filetype" },
					{ "fancy_lsp_servers" },
				},
			},
		})
	end,
}
