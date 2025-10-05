local g = vim.g
local o = vim.o

g.mapleader = ' '
g.maplocalleader = ' '
o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
o.mouse = 'a'
o.swapfile = false
o.clipboard = 'unnamedplus'

o.breakindent = true

o.undofile = true

o.ignorecase = true
o.smartcase = true


o.timeoutlen = 300
o.updatetime = 250

o.completeopt = 'menuone,noselect'
o.termguicolors = true
o.splitright = true
o.splitbelow = true
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
o.background = "dark"

--vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme catppuccin-mocha]]
-- vim.g.db_ui_save_location = '~/dadbod'
