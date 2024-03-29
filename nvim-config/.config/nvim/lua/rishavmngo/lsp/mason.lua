local on_attach = function(_, bufnr)
	vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)


	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end



	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap("gl", vim.diagnostic.open_float, 'open float diagnostic')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
	vim.keymap.set("n", "go", "<C-T>")
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
	nmap("<leader>lf", "<cmd>Format<CR>", "hey")


	-- nmap("<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
	-- nmap("<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
	-- nmap("<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
	-- nmap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
	-- vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>")

	-- vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	-- nmap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	lemminx = {},
	tsserver = {
		filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
		cmd = { "typescript-language-server", "--stdio" },
	},
	html = { filetypes = { 'html', 'twig', 'hbs' } },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			-- telemetry = { enable = false },
		},
	},
	emmet_ls = {
		cmd = { "emmet-ls", "--stdio" },
		filetype = { "html", "typescriptreact", "javascriptreact", "eruby", "javascript" },
	},
	prismals = {},
	cssls = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetype = { "css", "scss", "less" },
	},
	-- jdtls = {
	-- 	filetype = { "java" }
	-- }
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		"documentation",
-- 		"detail",
-- 		"additionalTextEdits",
-- 	},
-- }
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		if server_name == 'jdtls' then
			return
		end

		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end
}


-- function lua_ls.completion.on_complete(suggestions)
-- 	local popup = vim.ui.popup_create({
-- 		title = "Autocompletion Suggestions",
-- 		line = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[1],
-- 		col = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[2],
-- 	})
--
-- 	for _, suggestion in ipairs(suggestions) do
-- 		popup:add_line(suggestion.label)
-- 	end
--
-- 	popup:show()
-- end
