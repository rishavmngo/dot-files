local jdtls_config = require("rishavmngo.lsp.jdtls").setup()
local pkg_status, jdtls = pcall(require, "jdtls")

if not pkg_status then
	vim.notify("unable to load nvim-jdtls")
	return
end


-- local root_markers = { ".gradle", "gradlew", ".git" }
-- local root_dir = jdtls.setup.find_root(root_markers)
-- local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
-- local home = os.getenv("HOME")
-- local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local config = {
-- 	-- The command that starts the language server
-- 	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
-- 	cmd = {
--
-- 		'java',
-- 		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
-- 		'-Dosgi.bundles.defaultStartLevel=4',
-- 		'-Declipse.product=org.eclipse.jdt.ls.core.product',
-- 		'-Dlog.protocol=true',
-- 		'-Dlog.level=ALL',
-- 		'-Xmx1g',
-- 		'--add-modules=ALL-SYSTEM',
-- 		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
-- 		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
-- 		'org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.700.v20221108-1024.jar',
-- 		'-jar',
-- 		'/home/rishavmngo/Documents/jd/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.700.v20221108-1024.jar',
-- 		'-configuration', '/home/rishavmngo/Documents/jd/config_linux',
--
--
-- 		'-data', workspace_dir
-- 	},
--
-- 	root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew' }),
--
-- 	settings = {
-- 		java = {
-- 			signatureHelp = { enabled = true },
-- 			completion = {
-- 				favoriteStaticMembers = {},
-- 				filteredTypes = {
-- 					-- "com.sun.*",
-- 					-- "io.micrometer.shaded.*",
-- 					-- "java.awt.*",
-- 					-- "jdk.*",
-- 					-- "sun.*",
-- 				},
-- 			},
-- 			sources = {
-- 				organizeImports = {
-- 					starThreshold = 9999,
-- 					staticStarThreshold = 9999,
-- 				},
-- 			},
-- 			codeGeneration = {
-- 				toString = {
-- 					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
-- 				},
-- 				useBlocks = true,
-- 			},
-- 			configuration = {
-- 				runtimes = {
-- 					{
-- 						name = "JavaSE-1.8",
-- 						path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home",
-- 						default = true,
-- 					},
-- 					{
-- 						name = "JavaSE-17",
-- 						path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
-- 					},
-- 					{
-- 						name = "JavaSE-19",
-- 						path = "/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home",
-- 					},
-- 				},
-- 			},
--
-- 		}
-- 	},
--
-- 	init_options = {
-- 		bundles = {}
-- 	},
-- }

jdtls.start_or_attach(jdtls_config)
