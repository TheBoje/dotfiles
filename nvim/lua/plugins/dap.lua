local dap = require("dap")

-- configure codelldb adapter
dap.adapters.lldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

return {}
