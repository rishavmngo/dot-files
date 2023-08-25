local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "ss", ":sp<cr>")
map("n", "sv", ":vsp<cr>")
map("n", "sd", "<cmd>bd<cr>")
map("n", "sl", "<C-w>l")
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")


vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- vim.g.lf_netrw = 1
-- map("n", "<leader>f", ":LfCurrentDirectory<CR>")

vim.g.floaterm_opener = "vsplit"
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
vim.g.lf_split_type = 'v'
vim.keymap.set("n", "<leader>g", ":FloatermNew lazygit<CR>")
-- vim.keymap.set("n", "<leader>f", ":FloatermNew lfrun<CR>")
vim.keymap.set("n", "<leader>f", ":FloatermNew lf " .. vim.fn.expand("%:p") .. "<CR>")

vim.cmd([[
augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END
]])