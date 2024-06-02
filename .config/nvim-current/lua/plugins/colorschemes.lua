return {
  colorscheme = "gruvbox_material",
  {
    "sainnhe/gruvbox-material",
    -- enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
      vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#000000' } -- #0e1010
      -- vim.g.gruvbox_material_colors_override = { bg0 = "#121212" }
      -- vim.g.gruvbox_material_better_performance = 1

      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  {
    "neanias/everforest-nvim",
    -- enabled = true,
    lazy = true,
    priority = 1000,
  },
  {
    "f4z3r/gruvbox-material.nvim",
    -- enabled = true,
    config = function()
      require("gruvbox-material").setup({
        italics = true, -- enable italics in general
        contrast = "medium", -- set contrast, can be any of "hard", "medium", "soft"
        comments = {
          italics = true, -- enable italic comments
        },
        background = {
          transparent = false, -- set the background to transparent
        },
        float = {
          force_background = false, -- force background on floats even when background.transparent is set
          background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
          -- by the color scheme
        },
        signs = {
          highlight = true, -- whether to highlight signs
        },
        customize = nil, -- customize the theme in any way you desire, see below what this
        -- configuration accepts
      })
    end,
  },

  {
    "EdenEast/nightfox.nvim",

    config = function()
      -- Default options
      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = false, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0.3, -- Severity [0,1] for protan (red)
              deutan = 0.6, -- Severity [0,1] for deutan (green)
              tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- setup must be called before loading
      -- vim.cmd("colorscheme nightfox")
    end,
  },
}
