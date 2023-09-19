local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
	return
end

lazy.setup({
	spec = {
		{ "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
		'tpope/vim-dadbod',
		'kristijanhusak/vim-dadbod-ui',
		'kristijanhusak/vim-dadbod-completion',
		-- Database
		{
			"tpope/vim-dadbod",
			opt = true,
			requires = {
				"kristijanhusak/vim-dadbod-ui",
				"kristijanhusak/vim-dadbod-completion",
			},
			config = function()
				require("config.dadbod").setup()
			end,
		},
		{
			"lmburns/lf.nvim",
			requires = { "toggleterm.nvim" }
		},
		{ "ellisonleao/gruvbox.nvim", priority = 1000 },
		{
			"svrana/neosolarized.nvim",
			requires = { "tjdevries/colorbuddy.nvim" },
		}
		,
		{
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},
		"JoosepAlviste/nvim-ts-context-commentstring",
		{ "akinsho/bufferline.nvim", dependencies = 'nvim-tree/nvim-web-devicons' },
		{
			"norcalli/nvim-colorizer.lua",
		},

		"norcalli/nvim-colorizer.lua",
		--Lf
		"ptzz/lf.vim",
		"voldikss/vim-floaterm",

		"akinsho/toggleterm.nvim",

		-- autoTag and autopairs
		"windwp/nvim-autopairs",
		"windwp/nvim-ts-autotag",

		'tpope/vim-fugitive',
		'tpope/vim-rhubarb',

		{ 'navarasu/onedark.nvim' },
		-- Detect tabstop and shiftwidth automatically
		'tpope/vim-sleuth',

		-- NOTE: This is where your plugins related to LSP can be installed.
		--  The configuration is done below. Search for lspconfig to find it below.
		{
			-- LSP Configuration & Plugins
			'neovim/nvim-lspconfig',
			dependencies = {
				-- Automatically install LSPs to stdpath for neovim
				{ 'williamboman/mason.nvim', config = true },
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
				{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

				-- Additional lua configuration, makes nvim stuff amazing!
				'folke/neodev.nvim',
			},
		},

		{
			-- Autocompletion
			'hrsh7th/nvim-cmp',
			dependencies = {
				-- Snippet Engine & its associated nvim-cmp source
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',

				-- Adds LSP completion capabilities
				'hrsh7th/cmp-nvim-lsp',

				-- Adds a number of user-friendly snippets
				'rafamadriz/friendly-snippets',
			},
		},

		-- Useful plugin to show you pending keybinds.

		{
			-- Set lualine as statusline
			'nvim-lualine/lualine.nvim',
			-- See `:help lualine.txt`
			opts = {
				options = {
					icons_enabled = false,
					component_separators = '|',
					section_separators = '',
				},
			},
		},

		{
			-- Add indentation guides even on blank lines
			'lukas-reineke/indent-blankline.nvim',
		},

		-- "gc" to comment visual regions/lines
		{ 'numToStr/Comment.nvim' },

		-- Fuzzy Finder (files, lsp, etc)
		{
			'nvim-telescope/telescope.nvim',
			branch = '0.1.x',
			dependencies = {
				'nvim-lua/plenary.nvim',
				-- Fuzzy Finder Algorithm which requires local dependencies to be built.
				-- Only load if `make` is available. Make sure you have the system
				-- requirements installed.
				{
					'nvim-telescope/telescope-fzf-native.nvim',
					-- NOTE: If you are having trouble with this installation,
					--       refer to the README for telescope-fzf-native for more instructions.
					build = 'make',
					cond = function()
						return vim.fn.executable 'make' == 1
					end,
				},
			},
		},

		{
			-- Highlight, edit, and navigate code
			'nvim-treesitter/nvim-treesitter',
			dependencies = {
				'nvim-treesitter/nvim-treesitter-textobjects',
			},
			build = ':TSUpdate',
		},


	}
})
