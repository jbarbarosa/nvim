local M = {
  "folke/which-key.nvim",
  keys = {
    { "<leader>q", "<cmd>confirm q<cr>",  desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<cr>", desc = "NOHL" },
    { "<leader>v", "<cmd>vsplit<cr>",     desc = "Split (Vertical)" },
  },
  opts = {
    mode = "n",
    prefix = "<leader>",
  }
}

function M.config()
  local which_key = require "which-key"

  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }
end

return M
