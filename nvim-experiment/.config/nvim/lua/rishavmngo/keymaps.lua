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
vim.keymap.set("n", "sf", "<cmd>Lf<cr>")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>")
