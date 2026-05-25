vim.opt_local.commentstring = ";; %s"
vim.opt_local.iskeyword:append { "?", "!", "-", "+", "*", "/", "<", ">", "=", "'" }

local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<localleader>e", group = "Eval", buffer = 0 },
    { "<localleader>l", group = "Log", buffer = 0 },
    { "<localleader>t", group = "Test", buffer = 0 },
    { "<localleader>g", group = "Goto", buffer = 0 },
    { "<localleader>r", group = "REPL/Refresh", buffer = 0 },
    { "<localleader>s", group = "Session", buffer = 0 },
    { "<localleader>c", group = "Connect/Close", buffer = 0 },
  }, { mode = "n" })
end
