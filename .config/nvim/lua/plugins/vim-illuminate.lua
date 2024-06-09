return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		filetypes_denylist = {
      "mason",
      "harpoon",
      "neo-tree",
      "DressingInput",
      "NeogitCommitMessage",
      "qf",
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "lazy",
      "Trouble",
      "netrw",
      "lir",
      "DiffviewFiles",
      "Outline",
      "Jaq",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
		},
	},
	lazy = false,

	config = function(_, opts)
		require("illuminate").configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]w", "next")
    map("[w", "prev")
	end,

	keys = {
		{ "]w", desc = "Next Reference" },
		{ "[w", desc = "Previous Reference" },
	},
}
