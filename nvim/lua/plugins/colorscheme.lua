-- 主题，同时lualine.lua也需要设置
return {
    {
        "sainnhe/sonokai",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            local colorscheme = "sonokai"
            local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
            if not status_ok then
                vim.notify("colorscheme " .. colorscheme .. " not found")
                return
            end
        end,
    },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         local colorscheme = "gruvbox"
    --         local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    --         if not status_ok then
    --             vim.notify("colorscheme " .. colorscheme .. " not found")
    --             return
    --         end
    --     end,
    -- },
    -- {
    --     "navarasu/onedark.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         local colorscheme = "onedark"
    --         local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    --         if not status_ok then
    --             vim.notify("colorscheme " .. colorscheme .. " not found")
    --             return
    --         end
    --     end,
    -- },
    -- {
    --     "sainnhe/everforest",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         local colorscheme = "everforest"
    --         local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    --         if not status_ok then
    --             vim.notify("colorscheme " .. colorscheme .. " not found")
    --             return
    --         end
    --     end,
    -- },
}
