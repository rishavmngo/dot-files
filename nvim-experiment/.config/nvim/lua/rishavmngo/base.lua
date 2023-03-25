vim.opt.timeoutlen = 300
vim.opt.rnu = true
vim.opt.mouse = "a"
vim.opt.ru = true
vim.opt.backup = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.cursorline = true
vim.cmd("colorscheme gruvbox")
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.cmd([[let g:lf_map_keys = 0]])
--
-- vim.cmd([[  let g:lf_replace_netrw = 1]])
--
--
--
-- To change the color of error
vim.cmd([[hi DiagnosticError guifg=#EB455F ]])

vim.api.nvim_create_user_command("Playground", "lua playground()", { bang = true })
