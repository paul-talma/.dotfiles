return {
	cmd = { "ruff", "server", "--preview" },
	filetypes = { "python" },
	root_markers = {
		'pyproject.toml',
		'ruff.toml',
		'.ruff.toml',
		'.git',
	},
	init_options = {
		settings = {
			args = { "--format=on" },
		},
	},
}
