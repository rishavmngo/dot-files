local M = {}

function M.toggleInlayHints()
  vim.lsp.inlay_hint.enable(false, not vim.lsp.inlay_hint.is_enabled())
end

return M
