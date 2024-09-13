return {
	"m4xshen/autoclose.nvim",
	event = { "InsertEnter" },
	config = function()
		local autoclose = require("autoclose")
		autoclose.setup({
			keys = {
				["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "tex", "txt" } },
				["["] = { escape = true, close = true, pair = "[]", disabled_filetypes = { "tex" } },
			},
		})
	end,
}
