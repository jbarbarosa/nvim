local M = {
    "mfussenegger/nvim-dap",
}

M.config = function()
  require("dap").configurations.java = {
    {
      name = "Debug (Attach) - Remote",
      type = "java",
      request = "attach",
      hostName = "127.0.0.1",
      port = 5022,
    },
  }
end

return M
