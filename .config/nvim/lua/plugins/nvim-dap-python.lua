-- Configuration for the python debugger
-- - configures debugpy for use
-- - uses the debugpy installation from mason
return {
	"mfussenegger/nvim-dap-python",
	dependencies = "mfussenegger/nvim-dap",
	lazy = true,
	config = function()
		-- uses the debugypy installation by mason
		local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
			.. "/venv/bin/python3"
		require("dap-python").setup(debugpyPythonPath, {}) ---@diagnostic disable-line: missing-fields
	end,
}
