local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  }
}

function M.config()
  require("dapui").setup({
    layouts = {
      {
        elements = {
          {
            id = 'scopes',
            size = 0.25,
          },
          {
            id = 'watches',
            size = 0.25,
          },
          {
            id = 'breakpoints',
            size = 0.25,
          },
          {
            id = 'stacks',
            size = 0.25,
          },
        },
        position = 'right',
        size = 0.28,
      },
      {
        elements = {
          {
            id = 'repl',
            size = 0.5,
          },
          {
            id = 'console',
            size = 0.5,
          },
        },
        position = 'bottom',
        size = 0.3,
      },
    },
  })
end

return M
