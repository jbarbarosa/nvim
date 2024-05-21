local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- dap
keymap("n", "<leader>dd", "<cmd> lua require('dap-ui').toggle()<CR>", opts)
keymap("n", "<leader>db", "<cmd> lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dn", "<cmd> lua require('dap').step_over()<CR>", opts)
keymap("n", "<leader>di", "<cmd> lua require('dap').step_into()<CR>", opts)
keymap("n", "<leader>dc", "<cmd> lua require('dap').continue()<CR>", opts)
keymap("n", "<leader>dC", "<cmd> lua require('dap').run_to_cursor()<CR>", opts)
keymap("n", "<leader>dq", "<cmd> lua require('dap').terminate()<CR>", opts)
keymap("n", "<leader>dt", "<cmd> lua require('dap-go').debug_test()<CR>", opts)
keymap("n", "<leader>dl", "<cmd> lua require('dap-go').debug_last_test()<CR>", opts)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
