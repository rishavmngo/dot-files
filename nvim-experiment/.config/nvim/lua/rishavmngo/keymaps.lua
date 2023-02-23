-- keybindings
vim.keymap.set("n", "<space>w", "<cmd>write<cr>", { desc = "" })
vim.keymap.set("n", "<leader>s", "<cmd>source %<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>Ccompile<cr>")
vim.keymap.set("n", "<leader>ci", "<cmd>Cinput<cr>")
vim.keymap.set("n", "<C-a>", ":keepjumps normal! ggVG<cr>")
-- vim.keymap.set({'n','x'},'x','"_x')
vim.keymap.set("n", "ss", ":sp<cr>")
vim.keymap.set("n", "sv", ":vsp<cr>")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")

-- vim.keymap.set("n", "sf", "<cmd>Lf<cr>")
vim.keymap.set("n", "sd", "<cmd>bd<cr>")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>")
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
vim.keymap.set("n", "<leader>g", ":FloatermNew lazygit<CR>")
-- vim.keymap.set("n", "<leader>f", ":FloatermNew lfrun<CR>")
vim.keymap.set("n", "<leader>f", ":FloatermNew lfrun " .. vim.fn.expand("%:p") .. "<CR>")
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim")
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview")
vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast")

vim.keymap.set("n", "<leader>p", "<Plug>MarkdownPreview")

vim.cmd([[
augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END
]])
