local on_attach = require("plugins.lsp.lspconfig").on_attach
local capabilities = require("plugins.lsp.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options