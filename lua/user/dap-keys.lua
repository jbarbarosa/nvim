local M = {
  "folke/which-key.nvim"
}

local find_go_mod_dir = function(start_path)
  local dir = vim.fn.fnamemodify(start_path, ":h")
  while dir ~= "/" and dir ~= "" do
    if vim.fn.filereadable(dir .. "/go.mod") == 1 then
      return dir
    end
    local parent = vim.fn.fnamemodify(dir, ":h")
    if parent == dir then break end
    dir = parent
  end
  return nil
end

local debug_function = function()
  return function()
    local ft = vim.bo.filetype
    if ft == "java" then
      require 'jdtls'.test_nearest_method()
    elseif ft == "go" then
      local file = vim.fn.expand("%:p")
      local module_dir = find_go_mod_dir(file)
      if module_dir then
        local file_dir = vim.fn.fnamemodify(file, ":h")
        local relative = file_dir:sub(#module_dir + 2)
        if relative == "" then relative = "." end
        require('dap-go').debug_test({
          cwd = file_dir,
          program = "./" .. relative,
          dlvCwd = module_dir,
        })
      else
        require('dap-go').debug_test()
      end
    else
      error("filetype not configured: " .. ft)
    end
  end
end

M.config = function()
  require("which-key").add({
    {
      { "<leader>d",  group = "Dap (Debugger)" },
      { "<leader>dd", "<cmd> lua require('dapui').toggle()<CR>",           desc = "Toggle DAP UI" },
      { "<leader>db", "<cmd> lua require('dap').toggle_breakpoint()<CR>",  desc = "Toggle Breakpoint" },
      { "<leader>dn", "<cmd> lua require('dap').step_over()<CR>",          desc = "Step over" },
      { "<leader>di", "<cmd> lua require('dap').step_into()<CR>",          desc = "Step into" },
      { "<leader>dc", "<cmd> lua require('dap').continue()<CR>",           desc = "Continue" },
      { "<leader>dC", "<cmd> lua require('dap').run_to_cursor()<CR>",      desc = "Run to cursor" },
      { "<leader>dq", "<cmd> lua require('dap').terminate()<CR>",          desc = "Teminate" },
      { "<leader>dt", debug_function(),                                    desc = "Debug test" },
      { "<leader>dl", "<cmd> lua require('dap-go').debug_last_test()<CR>", desc = "Debug last test" },
      {
        "<leader>dB",
        function()
          vim.ui.input({ prompt = "Breakpoint condition (leave empty for none): " }, function(input)
            if input == nil or input == "" then
              require("dap").toggle_breakpoint()
            else
              require("dap").set_breakpoint(input)
            end
          end)
        end,
        desc = "Conditional breakpoint"
      },
    },
    {
      mode = "n"
    }
  })
end

return M
