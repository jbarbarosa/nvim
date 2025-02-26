local M = {
    {
        "LunarVim/darkplus.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "sainnhe/gruvbox-material",
        name = "gruvbox-material"
    },
    {
        "morhetz/gruvbox",
        name = "gruvbox"
    }
}

function M.config()
    vim.cmd.colorscheme "gruvbox"
end

return M
