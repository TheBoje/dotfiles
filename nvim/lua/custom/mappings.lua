local M = {}

M.abc = {
  n = {
    ["<C-o>"] = {":ClangdSwitchSourceHeader<CR>", "Switch between Source and Header file"},
    ["<A-u>"] = {":SymbolsOutline<CR>", "Toggle Symbols Outline buffer"},
    ["<leader>do"] = {":lua vim.diagnostic.open_float()<CR>", "Open diagnostics list"},
    ["<leader>d["] = {":lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic"},
    ["<leader>d]"] = {":lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic"},
    ["<leader>dd"] = {":Telescope diagnostics<CR>", "Open Telescope diagnostics list"},
    ["<C-tab>"] = { function() require("nvchad_ui.tabufline").tabuflinePrev() end, "Goto prev buffer"},

    -- DEBUGGER / NVIM DAP
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line"},
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger"},
    ["<F5>"] = { function() require('dap').continue() end, "Debugger continue"},
    ["<F10>"] = { function() require('dap').step_over() end, "Debugger step over"},
    ["<F11>"] = { function() require('dap').step_into() end, "Debugger step into"},
    ["<F12>"] = { function() require('dap').step_out() end, "Debugger step out"},
    ["<leader>dh"] = { function() require('dap.ui.widgets').hover() end, "Debugger widget hover"},
    ["<leader>dp"] = { function() require('dap.ui.widgets').preview() end, "Debugger widget preview"},
    ["<leader>df"] = { function()
        local widgets = require('dap.ui.widgets').widgets
        widgets.centered_float(widgets.frames)
    end, "Debugger widget floating frames"},
    ["<leader>ds"] = { function()
      local widgets = require('dap.ui.widgets').widgets
      widgets.centered_float(widgets.scopes)
    end, "Debugger widget floating scopes"},

    -- GIT / GIT WORKTREE
    ["<leader>gw"] = { function() require("telescope").extensions.git_worktree.git_worktrees() end, "Git worktrees in Telescope"},
    ["<leader>gaw"] = { function() require("telescope").extensions.git_worktree.create_git_worktree() end, "Create git worktree in Telescope"},

    -- PERFORCE / QUANTIC PERFORCE
    -- TODO(LOUIS)
  }
}

return M
