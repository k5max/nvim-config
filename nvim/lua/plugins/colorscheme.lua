-- 主题，同时lualine.lua也需要设置
return {
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
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
           vim.cmd[[colorscheme tokyonight-moon]]
        end,
    },
    {
        "navarasu/onedark.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
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
        "catppuccin/nvim",
        enabled = false,
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })
            vim.cmd("colorscheme catppuccin")
        end
    },
    {
        "sainnhe/sonokai",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme sonokai")
        end,
    },
    {
        "sainnhe/everforest",
        enabled = false,
        lazy = false,
        priority = 1000,
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
}
