return {
	"nvim-treesitter/nvim-treesitter",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"latex",
				"markdown",
				"markdown_inline",
				"json",
			},

			sync_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					node_decremental = "<BS>",
				},
			},
		})
	end,
}
