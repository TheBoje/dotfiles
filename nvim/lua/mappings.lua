require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n","<C-o>", ":ClangdSwitchSourceHeader<CR>", {desc = "Switch between Source and Header file"})
map("n","<A-u>",":SymbolsOutline<CR>", {desc = "Toggle Symbols Outline buffer"})
map("n","<leader>do", ":lua vim.diagnostic.open_float()<CR>", {desc = "Open diagnostics list"})
map("n", "<leader>d[",":lua vim.diagnostic.goto_prev()<CR>", {desc="Go to previous diagnostic"})
map("n", "<leader>d]", ":lua vim.diagnostic.goto_next()<CR>", {desc="Go to next diagnostic"})
map("n", "<leader>dd", ":Telescope diagnostics<CR>", {desc="Open Telescope diagnostics list"})
map("n", "<leader>ss", ":lua require('telescope.builtin').lsp_dynamic_worksapce_symbols()<CR>", {desc="Open Telescope LSP Symbol list"})
map("n", "<leader>tr", ":lua require('telescope.builtin').resume()<CR>", {desc="Re-open last Telescope buffer (Resume)"})
map("n", "<leader>nf", ":lua require('neogen').generate()<CR>", {desc="Generate doxygen comment"})
map("n", "<C-tab>", ":lua require('nvchad_ui.tabufline').tabuflinePrev()<CR>", {desc="Go to previous buffer"})

    -- DEBUGGER / NVIM DAP
    -- ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line"},
    -- ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger"},
    -- ["<F5>"] = { function() require('dap').continue() end, "Debugger continue"},
    -- ["<F10>"] = { function() require('dap').step_over() end, "Debugger step over"},
    -- ["<F11>"] = { function() require('dap').step_into() end, "Debugger step into"},
    -- ["<F12>"] = { function() require('dap').step_out() end, "Debugger step out"},
    -- ["<leader>dh"] = { function() require('dap.ui.widgets').hover() end, "Debugger widget hover"},
    -- ["<leader>dp"] = { function() require('dap.ui.widgets').preview() end, "Debugger widget preview"},
    -- ["<leader>df"] = { function()
    --     local widgets = require('dap.ui.widgets').widgets
    --     widgets.centered_float(widgets.frames)
    -- end, "Debugger widget floating frames"},
    -- ["<leader>ds"] = { function()
    --   local widgets = require('dap.ui.widgets').widgets
    --   widgets.centered_float(widgets.scopes)
    -- end, "Debugger widget floating scopes"},

    -- GIT / GIT WORKTREE
    -- ["<leader>gw"] = { function() require("telescope").extensions.git_worktree.git_worktrees() end, "Git worktrees in Telescope"},
    -- ["<leader>gaw"] = { function() require("telescope").extensions.git_worktree.create_git_worktree() end, "Create git worktree in Telescope"},

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
