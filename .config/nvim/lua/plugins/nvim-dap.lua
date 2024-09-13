return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Start/Continue Debugger",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Add Breakpoint",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate Debugger",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step over",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step into",
		},
	},
}

-- ,return {
-- 	"mfussenegger/nvim-dap",
--
-- 	dependencies = {
-- 		"williamboman/mason.nvim",
-- 		"rcarriga/nvim-dap-ui",
-- 		"nvim-neotest/nvim-nio",
-- 	},
--
-- 	config = function()
-- 		local dap = require("dap")
-- 		local ui = require("dapui")
--
-- 		ui.setup()
--
-- 		dap.adapters.python = {
-- 			type = "executable",
-- 			command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
-- 			args = { "-m", "debugpy.adapter" },
-- 		}
-- 		dap.configurations.python = {
-- 			{
-- 				type = "python",
-- 				request = "launch",
-- 				name = "Launch file",
-- 				program = "${file}",
-- 				pythonPath = function()
-- 					return "/usr/bin/python"
-- 				end,
-- 			},
-- 		}
-- 	end,
-- }
