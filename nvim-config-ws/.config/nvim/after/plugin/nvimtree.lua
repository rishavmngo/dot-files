local keymap = vim.keymap
local nvim_tree = require('nvim-tree')
local map = vim.keymap.set
nvim_tree.setup({
	update_cwd = true,
	hijack_cursor = true,
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	view = {
		width = 32,
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ':t',
		icons = {
			glyphs = {
				default = '',
				symlink = '',
				bookmark = '◉',
				git = {
					unstaged = '',
					staged = '',
					unmerged = '',
					renamed = '',
					deleted = '',
					untracked = '',
					ignored = '',
				},

				folder = {
					default = '',
					open = '',
					symlink = '',
				},
			},
			show = {
				git = true,
				file = true,
				folder = true,
				folder_arrow = true,
			},
		},
		indent_markers = {
			enable = true,
		},
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		-- Default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- Custom mappings
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
		end
		map("n", "<cr>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
		map("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))

		vim.keymap.del('n', 's', opts('Run System'))
		-- vim.keymap.del('n', 'S', opts('Search'))

		vim.keymap.set('n', 'o', api.node.run.system, opts('Run System'))
	end,
})

keymap.set('n', ';a', '<Cmd>NvimTreeFindFileToggle<CR>', { silent = true })
-- keymap.set('n', ';;', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
