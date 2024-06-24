vim.wo.number = true
vim.opt.clipboard = "unnamedplus"

vim.lsp.start_client({
  name = 'my-server-name',
  cmd = {'lua-language-server'},
  filetypes = {"lua"},
  root_dir = vim.fs.dirname(vim.fs.find({'pyproject.toml', 'setup.py'}, { upward = true })[1]),
})
