local dap = require("dap")

dap.set_log_level('INFO')
dap.configurations.cpp = {
  {
    name = "(cppdbg) Launch",
    type = "cppdbg",
    request = "launch",
    cwd = '${workspaceFolder}',
    program = "${workspaceFolder}/build/debug/apps/nefario/nefario.bin",
    stopAtEntry = true,
  },
  {
    name = '(cppdbg) Attach',
    type = 'cppdbg',
    request = 'attach',
    MIMode = 'gdb',
    processId = '${command:pickProcess}',
    cwd = '${workspaceFolder}',
    program = "${workspaceFolder}/build/debug/apps/nefario/nefario.bin",
  },
}

dap.adapters.executable = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
  name = 'lldb1',
  host = '127.0.0.1',
  port = 13000
}
dap.adapters.codelldb = {
  name = "codelldb server",
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },
  }
}
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

require("dapui").setup()
require ('mason-nvim-dap').setup({
    ensure_installed = {'cppdbg', 'codelldb'},
    handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
    },
})

