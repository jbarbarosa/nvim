return {
  "julienvincent/nvim-paredit",
  ft = { "clojure", "fennel", "scheme", "lisp", "racket" },
  config = function()
    require("nvim-paredit").setup {
      use_default_keys = true,
      indent = { enabled = true },
    }
  end,
}
