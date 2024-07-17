return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		ui.setup()

		dap.adapters.python = {
			type = "executable",
			command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
			args = { "-m", "debugpy.adapter" },
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					return "/usr/bin/python"
				end,
			},
		}
	end,
}
