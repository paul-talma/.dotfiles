return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				file_browser = {
					-- hijack_netrw = true,
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
	keys = {
		{
			"<leader>fe",
			function()
				require("telescope").extensions.file_browser.file_browser()
			end,
			mode = "n",
			desc = "Open Telescope file browser",
		},
	},
}
