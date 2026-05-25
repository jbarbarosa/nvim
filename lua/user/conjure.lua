return {
  "Olical/conjure",
  lazy = true,
  ft = { "clojure", "fennel" },
  init = function()
    vim.g["conjure#log#hud#enabled"] = true
    vim.g["conjure#log#hud#width"] = 0.42
    vim.g["conjure#log#hud#height"] = 0.42
    vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = true
    vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure-test"
    vim.g["conjure#mapping#doc_word"] = false
    vim.g["conjure#extract#tree_sitter#enabled"] = true
  end,
}
