local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "lua_ls", "bashls", "cmake", "qmlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local clangd_capabilities = capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = clangd_capabilities,
  cmd = {
    "/u/opt3production/production.CentOS-7.4/Opt/P-20230605-Opt-22_0002_0008/bin/clangd", "--background-index", "--compile-commands-dir=./build/dev", "--all-scopes-completion", "--suggest-missing-includes", "-j=16", "--cross-file-rename" }
}

