local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
luasnip.config.setup {}


local t = luasnip.text_node
local i = luasnip.insert_node
local s = luasnip.snippet
local f = luasnip.function_node
local function fn(
	args,  -- text from i(2) in this example i.e. { { "456" } }
	parent, -- parent snippet or parent node
	user_args -- user_args from opts.user_args
)
	return args[1][1] .. user_args
end
luasnip.add_snippets("cpp", {
	s("leetcode", {
		t({
			"#include <iostream>",
			"#include <vector>",
			"#include <limits.h>",
			"#include <algorithm>",
			"",
			"using namespace std;",
			"",
			"class Solution {",
			"public:",
			"",
		}),
		i(1, "int"),
		t(" "),
		i(2, "missingNumber"),
		t("(vector<int> &nums) {"),
		t({
			"}",
			"};",
			"int main(void) {",
			"Solution sol;",
			"vector<int> v = {0, 2, 3, 0, 5, 6, 7};",
			"",
			"cout << sol.",
		}),
		f(fn, { 2 }, { user_args = { "(v);" } }),
		t({ "", "// for (auto x : v) {", '//   cout << x << " ";', "// }", "}" }),
	}),
})


local lspkind = require('lspkind')
-- 
local kind_icons = {
	Text = "",
	Method = "Ṁ",
	Function = "ƒ",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "ﱟ",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local compare = require("cmp.config.compare")

cmp.setup {
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			-- border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			local type = vim_item.kind
			vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = type
			return vim_item
		end
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-h>'] = cmp.mapping.scroll_docs(-4),
		['<C-l>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp', },
		{ name = 'luasnip', },
		{ name = "vim-dadbod-completion" },
		{ name = "buffer", },
		{ name = "path", }
	}
	-- sorting = {
	-- 	priority_weight = 10,
	-- 	comparators = {
	-- 		compare.score,
	-- 		compare.order,
	-- 	},
	-- }
}


vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#3A3A3A", bg = "#3ddbd9" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#3A3A3A", bg = "#3ddbd9" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#3A3A3A", bg = "#3ddbd9" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#ffffff", bg = "#78a9ff" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#ffffff", bg = "#78a9ff" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#ffffff", bg = "#78a9ff" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#ffffff", bg = "#E95396" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#ffffff", bg = "#E95396" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#ffffff", bg = "#E95396" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#3A3A3A", bg = "#33B1FF" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#3A3A3A", bg = "#33B1FF" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#3A3A3A", bg = "#33B1FF" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#3A3A3A", bg = "#33B1FF" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#3A3A3A", bg = "#33B1FF" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#ffffff", bg = "#673AB7" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#ffffff", bg = "#673AB7" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#ffffff", bg = "#673AB7" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#3A3A3A", bg = "#42b365" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#3A3A3A", bg = "#42b365" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#3A3A3A", bg = "#42b365" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#3A3A3A", bg = "#be95ff" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#3A3A3A", bg = "#be95ff" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#3A3A3A", bg = "#82CFFF" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#3A3A3A", bg = "#82CFFF" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#3A3A3A", bg = "#82CFFF" })
