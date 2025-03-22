return {
	"mfussenegger/nvim-dap",

	event = "VeryLazy",

	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		ui.setup()

		dap.adapters.python = {
			type = "executable",
			command = os.getenv("CONDA_PREFIX") .. "/bin/python",
			args = { "-m", "debugpy.adapter" },
		}
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/continue debugger" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate debugger" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, { desc = "Run to cursor" })
	end,
}
