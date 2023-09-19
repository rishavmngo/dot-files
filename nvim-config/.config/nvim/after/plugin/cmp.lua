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
cmp.setup {
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
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "vim-dadbod-completion" }
	},
}
