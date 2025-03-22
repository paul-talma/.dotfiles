-- TODO: replace mini with mini-files
return {
	"echasnovski/mini.nvim",
	version = "*",

	config = function()
		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 50,
			},
		})

		local map = vim.keymap

		map.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open file explorer" })
	end,
}
