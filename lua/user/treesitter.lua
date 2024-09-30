local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true,
  }
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "go", "ruby", "json", "javascript", "typescript", "yaml" },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true
  }
end

return M
