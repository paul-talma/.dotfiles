return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		-- TODO: fix null-ls
		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.ruff,
			},
		})
	end,
}
