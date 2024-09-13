return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	event = "VeryLazy",
	init = function()
		-- do nothing
	end,
	keys = {
		{ "<leader>e", ":Neotree filesystem toggle reveal float<CR>", silent = true, desc = "Floating File Explorer" },
		{ "<leader><tab>", ":Neotree filesystem toggle reveal right<CR>", silent = true, desc = "Right File Explorer" },
		-- { "<leader>fe", ":Neotree focus right<CR>", silent = true, desc = "Focus Right File Explorer" },
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			enable_git_status = true,
			close_if_last_window = true,
			sort_case_insensitive = true,
			enable_diagnostics = true,

			popup_border_style = "solid",

			default_component_configs = {

				container = {
					enable_character_fade = true,
				},

				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},

				name = {
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},

				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},

			window = {
				position = "right",
			},

			filesystem = {
				hijack_netrw_behavior = "disabled",
			},

			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "   Files " },
					{ source = "buffers", display_name = "   Bufs " },
					{ source = "git_status", display_name = "   Git " },
				},
			},
		})
	end,
}
