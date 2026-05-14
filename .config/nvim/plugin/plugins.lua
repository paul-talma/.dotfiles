vim.pack.add({
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/mrjones2014/smart-splits.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/mfussenegger/nvim-jdtls",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/j-hui/fidget.nvim",
})

vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")

local map = vim.keymap.set

-- oil
require("oil").setup()
map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent dir" })

-- mini
require("mini.indentscope").setup({
	symbol = "│",
})
-- require('mini.ai').setup()
require("mini.surround").setup()
require("mini.icons").setup()

-- smart splits
local ss = require("smart-splits")
ss.setup()
map("n", "<A-h>", ss.resize_left)
map("n", "<A-j>", ss.resize_down)
map("n", "<A-k>", ss.resize_up)
map("n", "<A-l>", ss.resize_right)

-- fzf
local fzf = require("fzf-lua")
fzf.setup()
map("n", "<leader>f", fzf.files, { desc = "fzf files" })
map("n", "<leader>e", fzf.global, { desc = "fzf global" })
map("n", "<leader>rr", fzf.resume, { desc = "fzf resume" })
map("n", "<leader>gg", fzf.live_grep_native, { desc = "fzf grep" })
map("n", "<leader>ca", fzf.lsp_code_actions, { desc = "fzf code actions" })
map("n", "<leader>sp", fzf.lsp_document_symbols, { desc = "fzf document symbols" })
map("n", "<leader>sP", fzf.lsp_live_workspace_symbols, { desc = "fzf workspace symbols" })
map("n", "<leader>jk", fzf.buffers, { desc = "fzf buffers" })
map("n", "<leader>re", fzf.lsp_references, { desc = "fzf references" })
map("n", "<leader>da", fzf.lsp_document_diagnostics, { desc = "fzf docu diagnostics" })
map("n", "<leader>Da", fzf.lsp_workspace_diagnostics, { desc = "fzf docu diagnostics" })
map("n", "<leader>zz", fzf.builtin, { desc = "fzf picker" })

-- ui2
require("vim._core.ui2").enable()

-- treesitter
local ts = require("nvim-treesitter")
require("nvim-treesitter-textobjects").setup()
ts.setup()
ts.ensure_installed = {
	"c",
	"lua",
	"ocaml",
	"vim",
	"vimdoc",
	"query",
	"python",
	"latex",
	"markdown",
	"markdown_inline",
	"json",
	"yaml",
	"java",
}

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
-- select
map({ "x", "o" }, "af", function()
	select.select_textobject("@function.outer", "textobjects")
end)
map({ "x", "o" }, "if", function()
	select.select_textobject("@function.inner", "textobjects")
end)
map({ "x", "o" }, "ac", function()
	select.select_textobject("@class.outer", "textobjects")
end)
map({ "x", "o" }, "ic", function()
	select.select_textobject("@class.inner", "textobjects")
end)

-- increment/decrement selection
map({ "n", "x" }, "<c-space>", function()
	vim.lsp.buf.selection_range(1)
end, { desc = "increment selection" })
map("x", "<bs>", function()
	vim.lsp.buf.selection_range(-1)
end, { desc = "decrement selection" })

-- move
map({ "n", "x", "o" }, "]f", function()
	move.goto_next_start("@function.outer", "textobjects")
end)
map({ "n", "x", "o" }, "[f", function()
	move.goto_previous_start("@function.outer", "textobjects")
end)
map({ "n", "x", "o" }, "]p", function()
	move.goto_next_start("@parameter.inner", "textobjects")
end)
map({ "n", "x", "o" }, "[p", function()
	move.goto_previous_start("@parameter.inner", "textobjects")
end)
map({ "n", "x", "o" }, "]c", function()
	move.goto_next_start("@class.inner", "textobjects")
end)
map({ "n", "x", "o" }, "[c", function()
	move.goto_previous_start("@class.inner", "textobjects")
end)

-- conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		sh = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		cuda = { "clang_format" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 1000,
	},
	formatters = {
		clang_format = {
			prepend_args = {
				"--style={IndentWidth: 4, AlignConsecutiveDeclarations: false, AlignConsecutiveAssignments: false, AlignAfterOpenBracket: true, AlignTrailingComments: true, BinPackParameters: false}",
			},
		},
	},
})

-- dap
local dap = require("dap")
dap.adapters = {
	lldb = {
		type = "executable",
		command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
		name = "lldb",
	},
}
dap.configurations = {
	c = {
		{
			type = "lldb",
			request = "launch",
			name = "Launch File",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			args = function()
				local input = vim.fn.input("Program arguments (space-separated): ")
				return vim.fn.split(input, " ", true)
			end,
			cwd = "${workspaceFolder}",
		},
	},
	cpp = {
		{
			type = "lldb",
			request = "launch",
			name = "Launch File",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			args = function()
				local input = vim.fn.input("Program arguments (space-separated): ")
				return vim.fn.split(input, " ", true)
			end,
			cwd = "${workspaceFolder}",
		},
	},
}
local dv = require("dap-view")
dv.setup({
	windows = {
		position = "right",
	},
})
dap.listeners.after.event_initialized["signcolumn"] = function()
	vim.o.signcolumn = "yes"
end
dap.listeners.after.event_terminated["signcolumn"] = function()
	vim.o.signcolumn = "no"
end
dap.listeners.after.disconnect["signcolumn"] = function()
	vim.o.signcolumn = "no"
end

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "dap toggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "dap continue" })
map("n", "<leader>dn", dap.step_over, { desc = "dap step over" })
map("n", "<leader>di", dap.step_into, { desc = "dap step into" })
map("n", "<leader>do", dap.step_out, { desc = "dap step out" })
map("n", "<leader>dq", dap.terminate, { desc = "dap terminate" })
map("n", "<leader>dw", dv.add_expr, { desc = "add expression to watchlist" })
map("n", "<leader>dv", dv.toggle, { desc = "open dap view" })

-- fidget
require("fidget").setup()
