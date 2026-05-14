vim.pack.add({
	"https://github.com/f4z3r/gruvbox-material.nvim",
})

local gb = require("gruvbox-material")
gb.setup({
	italics = true,
	contrast = "hard",
	comments = {
		italics = true,
	},
	background = {
		transparent = false,
	},
	customize = function(g, o)
		if g == "MatchParen" then
			o.bg = 0xe18e55
			o.fg = 0x000000
		end
		return o
	end,
})

vim.cmd.colorscheme("gruvbox-material")

for _, severity in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	local hl = vim.api.nvim_get_hl(0, { name = "DiagnosticUnderline" .. severity, link = false })
	hl.undercurl = nil
	hl.underline = true
	vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. severity, hl)
end
