local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "nvim-neotest/neotest-plenary",
    -- "/nvim-neotest/neotest-go",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add({
    {"<leader>t", group = "Neotest"},
    {"<leader>tt", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Test Nearest" },
    {"<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    {"<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Test" },
    {"<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Test Stop" },
    {"<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach Test" },
    {"<leader>tp", "<cmd>Neotest output-panel<cr>", desc = "Toggle Panel" },
    {"<leader>tu", "<cmd>Neotest summary<cr>", desc = "Toggle Summary" },
  },
    {
      mode = "n", prefix = "<leader>"
    }
  )

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M
