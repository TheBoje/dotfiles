local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

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

-- local utils = require "core.utils"

lspconfig["clangd"].setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    -- client.server_capabilities.documentRangeFormattingProvider = false

    -- utils.load_mappings("lspconfig", { buffer = bufnr })

    if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
    end
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
  capabilities = clangd_capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--background-index-priority=low",
    "--include-cleaner-stdlib",
    "-j=20",
    -- "--query-driver='D:\\Perforce\\SDK\\llvm-project\\bin\\clang-tidy'",
    "--clang-tidy",
    "--compile-commands-dir=" .. vim.fn.getcwd(),
    "--all-scopes-completion",
    "--pch-storage=memory",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--suggest-missing-includes",
    "--log=verbose",
  },
}
