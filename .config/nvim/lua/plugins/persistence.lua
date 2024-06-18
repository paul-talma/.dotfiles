return -- Lua
{
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
	-- config = function()
	-- 	local map = vim.keymap.set
	--
	-- 	map("n", "<leader>sr", "<cmd>lua require('persistence').load()<cr>", { desc = "Restore session" })
	-- end,
}
