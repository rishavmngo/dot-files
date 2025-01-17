local jdtls = require("jdtls")
local dap = require("dap")

local bundles = {
	vim.fn.glob(
		"/home/rishavmngo/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
		1
	),
}

local config = {
	settings = {
		java = {
			configuration = {
				runtimes = {
					-- {
					--   name = "JavaSE-11",
					--   path = "/usr/lib/jvm/java-11-openjdk",
					-- },
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk",
						default = true,
					},
					-- {
					--   name = "JavaSE-21",
					--   path = "/usr/lib/jvm/java-21-openjdk",
					-- },
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},
}
local root_markers = { ".git", "mvnw", "gradlew" }
local root_dir = jdtls.setup.find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local home = os.getenv("HOME")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
local lombok_path = vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"
config.cmd = {
	"jdtls",
	-- "-configuration", "/home/rishavmngo/.cache/jdtls",
	-- "-javaagent:/home/rishavmngo/.local/share/nvim/mason/share/jdtls/lombok.jar",
	"--jvm-arg=-javaagent:/home/rishavmngo/.local/share/nvim/mason/share/jdtls/lombok.jar",
	"-data",
	workspace_dir,
}

jdtls.start_or_attach(config)
