local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-neo"
  }
}

function M.config()
  require("dapui").setup()
end

return M
