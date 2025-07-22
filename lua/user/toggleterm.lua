return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader><space>", "<cmd>ToggleTerm direction=vertical size=50<cr>", desc = "Toggle Terminal (Vertical)" },
    { "<leader>H", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Toggle Terminal (Horizontal)" },
    {
      "<C-h>",
      "<cmd>wincmd h<cr>",
      desc = "Move to Left Window",
      mode = { "n", "t" },
    },
    {
      "<C-j>",
      "<cmd>wincmd j<cr>",
      desc = "Move to Below Window",
      mode = { "n", "t" },
    },
    {
      "<C-k>",
      "<cmd>wincmd k<cr>",
      desc = "Move to Above Window",
      mode = { "n", "t" },
    },
    {
      "<C-l>",
      "<cmd>wincmd l<cr>",
      desc = "Move to Right Window",
      mode = { "n", "t" },
    },
    {
      "<esc>",
      "<C-\\><C-n>",
      desc = "Exit Terminal Mode",
      mode = { "t" },
    },
  },
  config = true,
}
