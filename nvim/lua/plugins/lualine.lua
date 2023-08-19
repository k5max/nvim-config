return {
    -- lualine + nvim-web-devicons => 状态栏 + 图标
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    config = function()
        -- https://github.com/nvim-lualine/lualine.nvim
        local lualine = require("lualine")
        lualine.setup {
            options = {
                icons_enabled = true,
                -- All available themes are listed in https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
                -- auto is a special theme. It will automatically load theme for your colorscheme.
                -- If there's no theme available for your colorscheme then it'll try it's best to generate one.
                theme = 'auto',
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {{'filename', path = 3}},
                lualine_x = {'encoding', {'fileformat', symbols = {unix = "", dos = "", mac = ""}}, 'filetype'},
                -- lualine_x = {'encoding', {'fileformat', symbols = {unix = "LF", dos = "CRLF", mac = "CR"}}, 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
