local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.clang_format,
  formatting.stylua,
  -- formatting.cmake_format,

  lint.cmake_lint,
  lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
