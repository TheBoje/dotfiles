---@type ChadrcConfig


-- Auto set QML filetype, but does not work :(
-- vim.cmd('au BufRead,BufNewFile *.qml setFiletype qml')

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Highlight trailing whitespace
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- Format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


 local M = {}
 M.ui = {theme = 'onenord'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
