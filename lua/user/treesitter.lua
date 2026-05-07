local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
}

local ensure_installed = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "java",
  "bash",
  "go",
  "sql",
  "ruby",
  "json",
  "javascript",
  "typescript",
  "yaml",
  "clojure",
}

function M.config()
  require("nvim-treesitter").setup()

  require("nvim-treesitter").install(ensure_installed)

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true }),
    callback = function(args)
      local bufnr = args.buf
      local ft = vim.bo[bufnr].filetype
      local lang = vim.treesitter.language.get_lang(ft)
      if not lang then
        return
      end
      if pcall(vim.treesitter.start, bufnr, lang) then
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

return M
