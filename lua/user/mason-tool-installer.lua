local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim", -- for jdtls
}

function M.config()
  require("mason-tool-installer").setup {
    ensure_installed = {
      "java-debug-adapter",
      "java-test",
      "gofmt",
      "stylua",
      "luarocks",
    },
  }

  vim.api.nvim_command "MasonToolsInstall"
end

return M
