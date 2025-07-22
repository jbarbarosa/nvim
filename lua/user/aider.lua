return {
  "GeorgesAlkhouri/nvim-aider",
  lazy = false,
  keys = {
    { "<leader>a/", "<cmd>Aider toggle<cr>",       desc = "Toggle Aider" },
    { "<leader>as", "<cmd>Aider send<cr>",         desc = "Send to Aider",                  mode = { "n", "v" } },
    { "<leader>ac", "<cmd>Aider command<cr>",      desc = "Aider Commands" },
    { "<leader>ab", "<cmd>Aider buffer<cr>",       desc = "Send Buffer" },
    { "<leader>a+", "<cmd>Aider add<cr>",          desc = "Add File" },
    { "<leader>a-", "<cmd>Aider drop<cr>",         desc = "Drop File" },
    { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
    { "<leader>aR", "<cmd>Aider reset<cr>",        desc = "Reset Session" },
    { "<leader>a+", "<cmd>AiderTreeAddFile<cr>",   desc = "Add File from Tree to Aider",    ft = "NvimTree" },
    { "<leader>a-", "<cmd>AiderTreeDropFile<cr>",  desc = "Drop File from Tree from Aider", ft = "NvimTree" },
  },
  config = function()
    require("nvim_aider").setup({ aider_cmd = "aider --model ollama_chat/deepseek-coder" })
  end,
  dependencies = {
    "folke/snacks.nvim",
    --- The below dependencies are optional
    "catppuccin/nvim",
    "nvim-tree/nvim-tree.lua",
  },
}
