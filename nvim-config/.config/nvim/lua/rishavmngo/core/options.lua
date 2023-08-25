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
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
o.termguicolors = true
o.splitright = true
o.splitbelow = true
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
o.background = "dark"
vim.cmd [[colorscheme gruvbox]]
