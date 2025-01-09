local config = {
	cmd = {
		"/home/rishavmngo/.local/share/nvim/mason/bin/jdtls",
		"-configuration",
		"/home/rishavmngo/.cache/jdtls/config",
		"-data",
		"/home/rishavmngo/.cache/jdtls/workspace",
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
}

require("jdtls").start_or_attach(config)
