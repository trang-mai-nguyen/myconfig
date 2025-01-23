local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "mini.lsp.mason"
require("mini.lsp.handlers").setup()
require "mini.lsp.null-ls"
