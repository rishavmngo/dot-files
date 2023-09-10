require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		-- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = false,  -- shows the '~' characters after the end of buffers
	term_colors = false,         -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false,         -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15,       -- percentage of the shade to apply to the inactive window
	},
	no_italic = false,           -- Force no italic
	no_bold = false,             -- Force no bold
	no_underline = false,        -- Force no underline
	styles = {
		-- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		mocha = {
			-- base = "#24273a",
			-- mantle = "#242424",
			-- crust = "#474747",
			rosewater = "#ffc9c9",
			flamingo = "#ff9f9a",
			pink = "#ffa9c9",
			mauve = "#df95cf",
			lavender = "#a990c9",
			red = "#ff6960",
			maroon = "#f98080",
			peach = "#f9905f",
			yellow = "#f9bd69",
			green = "#b0d080",
			teal = "#a0dfa0",
			sky = "#a0d0c0",
			sapphire = "#95b9d0",
			blue = "#89a0e0",
			text = "#e0d0b0",
			subtext1 = "#d5c4a1",
			subtext0 = "#bdae93",
			overlay2 = "#928374",
			overlay1 = "#7c6f64",
			overlay0 = "#665c54",
			surface2 = "#504844",
			surface1 = "#3a3634",
			surface0 = "#252525",
			base = "#151515",
			mantle = "#0e0e0e",
			crust = "#080808",
		}
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
