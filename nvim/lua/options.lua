require "nvchad.options"

-- add yours here!

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Highlight trailing whitespace
vim.cmd "highlight ExtraWhitespace ctermbg=red guibg=red"
vim.cmd "match ExtraWhitespace /\\s\\+$/"

-- Line number in preview buffer of telescope
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

-- Format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Scroll offset
vim.o.scrolloff = 20

-- Disable Swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Set default shell to powershell
--local powershell_options = {
--  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--  shellcmdflag = "-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;", -- -NoLogo -NoProfile
--  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--  shellquote = "",
--  shellxquote = "",
--}

--for option, value in pairs(powershell_options) do
--  vim.opt[option] = value
--end

vim.filetype.add {
  shader = "hlsl", -- make .shader files to have hlsl as filetype
  hlsl = "hlsl", -- make .hlsl files to have hlsl filetype so treesitter gives it proper highlight
  glsl = "glsl", -- make .hlsl files to have hlsl filetype so treesitter gives it proper highlight
}
