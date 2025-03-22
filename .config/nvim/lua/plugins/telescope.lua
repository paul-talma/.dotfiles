return {
	"nvim-telescope/telescope.nvim",

	dependencies = {"nvim-lua/plenary.nvim"},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		local map = vim.keymap

		map.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "Open Telescope" })
		map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		map.set("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
		map.set("n", "<leader>fg", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
		-- map.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
	end,
}
