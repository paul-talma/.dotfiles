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
    keys = {
	    { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Floating File Explorer" },
	    { "<leader><tab>", ":Neotree toggle right<CR>", silent = true, desc = "Right File Explorer" },
			{ "<leader>fe", ":Neotree focus right<CR>", silent = true, desc = "Foocus Right File Explorer" },
    },
		config = function()
			require("neo-tree").setup({
				enable_git_status = true,
				sort_case_insensitive = true,
				default_component_configs = {
					modified = {
						symbol = " ",
          	highlight = "NeoTreeModified",
					},
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
		end
	}
