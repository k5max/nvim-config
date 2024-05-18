-- 主题，同时lualine.lua也需要设置
return {
    {
        "navarasu/onedark.nvim",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- 使用 pcall 命令
            -- local colorscheme = "onedark"
            -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
            -- if not status_ok then
            --     vim.notify("colorscheme " .. colorscheme .. " not found")
            --     return
            -- end
            -- vim.cmd("colorscheme onedark")
            require('onedark').setup {
                style = 'dark' -- Themes: dark darker cool deep warm warmer
            }
            require('onedark').load() -- 跟vim.cmd("colorscheme onedark")效果一样，是两种不同的应用主题的方式
        end,
    },
    {
        "morhetz/gruvbox",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.g.gruvbox_contrast_dark = "medium"
            -- vim.g.gruvbox_termcolors = 256,
            -- vim.g.gruvbox_undercurl = 1,
            -- vim.g.gruvbox_underline = 1,
            -- vim.g.gruvbox_bold = 1,
            -- vim.g.gruvbox_italic = 1
            vim.cmd("colorscheme gruvbox")
        end
    },
    {
        -- lua gruvbox
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string (mean medium)
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "sainnhe/sonokai",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd("colorscheme sonokai")
        end,
    },
    {
        "sainnhe/everforest",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd("colorscheme everforest")
        end,
    },
    {
        "hardhackerlabs/theme-vim",
        name = "hardhacker",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.hardhacker_hide_tilde = 1
            vim.g.hardhacker_keyword_italic = 1
            -- custom highlights
            vim.g.hardhacker_custom_highlights = {}
            vim.cmd("colorscheme hardhacker")
        end,
    },
    {
        "theniceboy/nvim-deus",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd("colorscheme deus")
        end,
    },
}
