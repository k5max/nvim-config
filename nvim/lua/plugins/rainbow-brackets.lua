return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
            vim.wo.colorcolumn = "99999"

            -- Multiple indent colors
            local highlight = {
                "RainbowGreen",
                "RainbowYellow",
                "RainbowRed",
                "RainbowOrange",
                "RainbowBlue",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            -- rainbow-delimiters.nvim integration
            vim.g.rainbow_delimiters = { highlight = highlight }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

            require("ibl").setup({
                indent = {
                    -- highlight = highlight,
                    char = "▏" -- "│" or "▎"
                },
                whitespace = {
                    remove_blankline_trail = false,
                },
                scope = {
                    enabled = true,
                    highlight = highlight,
                    show_start = true,
                    show_end = true,
                },
                exclude = {
                    filetypes = {
                        "help",
                        "startify",
                        "dashboard",
                        "packer",
                        "neogitstatus",
                        "NvimTree",
                        "terminal",
                        "TelescopePrompt",
                        "lsp-installer",
                        "lspinfo",
                        "toggleterm",
                        "log",
                        "markdown",
                    },
                    buftypes = { "terminal", "nofile" }
                },
            })
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    }
}
