require("options")
require("keymaps")
require("autocmds")
require("diagnostics")
require("lsp")

vim.lsp.enable({
	"lua_ls",
	"ty",
	"ruff",
	"clangd",
	"yamlls",
    "jdtls",
})

