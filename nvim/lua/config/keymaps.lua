-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<Tab>", ":bnext<CR>", { desc = "Do to next buffer" })
map("n", "<A-Tab>", ":bprev<CR>", { desc = "Do to previous buffer" })
map("n", "<C-o>", ":ClangdSwitchSourceHeader<CR>", { desc = "Switch between Source and Header file" })
map("n", "<A-u>", ":SymbolsOutline<CR>", { desc = "Toggle Symbols Outline buffer" })
map("n", "<leader>do", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostics list" })
map("n", "<leader>d[", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
map("n", "<leader>d]", ":lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
map("n", "<leader>dd", ":Telescope diagnostics<CR>", { desc = "Open Telescope diagnostics list" })
map(
  "n",
  "<leader>ss",
  ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
  { desc = "Open Telescope LSP Symbol list" }
)
map(
  "n",
  "<leader>tr",
  ":lua require('telescope.builtin').resume()<CR>",
  { desc = "Re-open last Telescope buffer (Resume)" }
)
map("n", "<F4>", "<CMD>DapDisconnect<CR>", { desc = "DAP Disconnect" })
map("n", "<F16>", "<CMD>DapTerminate<CR>", { desc = "DAP Terminate" })
map("n", "<F5>", "<CMD>DapContinue<CR>", { desc = "DAP Continue" })
map("n", "<F17>", function()
  require("dap").run_last()
end, { desc = "DAP Run Last" })
map("n", "<F6>", function()
  require("dap").run_to_cursor()
end, { desc = "DAP Run to Cursor" })
map("n", "<F9>", "<CMD>DapToggleBreakpoint<CR>", { desc = "DAP Toggle Breakpoint" })
map("n", "<F10>", "<CMD>DapStepOver<CR>", { desc = "DAP Step Over" })
map("n", "<F11>", "<CMD>DapStepInto<CR>", { desc = "DAP Step Into" })
map("n", "<F12>", "<CMD>DapStepOut<CR>", { desc = "DAP Step Out" })

map("n", "<C-F10>", "<CMD>DapStepOver<CR>", { desc = "DAP Step Over" })
map("n", "<C-F11>", "<CMD>DapStepInto<CR>", { desc = "DAP Step Into" })
map("n", "<C-F12>", "<CMD>DapStepOut<CR>", { desc = "DAP Step Out" })

map("n", "<C-S-j>", "<CMD>lua require('dap').down()<CR>", { desc = "DAP Callstack Down" })
map("n", "<C-S-k>", "<CMD>lua require('dap').up()<CR>", { desc = "DAP Callstack Up" })

map("n", "<C-a>", "<CMD>FloatermToggle<CR>", { desc = "Toggle floating terminal" })
