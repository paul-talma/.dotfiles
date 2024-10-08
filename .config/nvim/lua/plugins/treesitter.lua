return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
				},

				indent = {
					enable = true,
				},

				ensure_installed = {
					"lua",
					"c",
					"vim",
					"vimdoc",
					"query",
					"python",
					"markdown",
					"markdown_inline",
				},

				-- dont' know what these do but raises warning if not present
				modules = {},
				ignore_install = {},
			})
		end,
	},
}
