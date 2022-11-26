local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "rishavmngo.lsp.mason"
require("rishavmngo.lsp.handlers").setup()
require "rishavmngo.lsp.null-ls"
