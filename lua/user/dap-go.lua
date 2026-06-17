local M = {
  "leoluz/nvim-dap-go"
}

function M.config()
  require("dap-go").setup({})

  local dap = require("dap")
  local original_adapter = dap.adapters.go
  dap.adapters.go = function(callback, client_config)
    original_adapter(function(adapter_config)
      if client_config.dlvCwd then
        adapter_config = vim.deepcopy(adapter_config)
        adapter_config.executable = adapter_config.executable or {}
        adapter_config.executable.cwd = client_config.dlvCwd
      end
      callback(adapter_config)
    end, client_config)
  end
end

return M
