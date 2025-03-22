return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>fo",
			function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
				})
			end,
			mode = "",
			desc = "Format buffer",
		},
	},

	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts

	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = {
				"ruff_format",
				"ruff_fix",
				"ruff_organize_imports",
			},
		},

		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},

		formatters = {
			ruff_format = {
				args = { "format", "-" },
			},
		},
	},
}
