local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
-- augroup('setIndent', { clear = true })
-- autocmd('Filetype', {
--   group = 'setIndent',
--   pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
--     'yaml', 'lua'
--   },
--   command = 'setlocal shiftwidth=4 tabstop=4'
-- })


-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
