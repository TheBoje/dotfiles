-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Scroll offset
vim.o.scrolloff = 20

-- Disable Swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.filetype.add({
  extension = {
    shader = "hlsl",
    hlsl = "hlsl",
    glsl = "glsl",
  },
})

-- Softwrap
-- vim.opt.wrap = true
