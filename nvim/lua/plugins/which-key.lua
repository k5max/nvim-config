return {
    -- which-key => 键盘绑定导航
    "folke/which-key.nvim",
    config = function()
        local which_key = require("which-key")
        local setup = {
            plugins = {
                marks = false,        -- shows a list of your marks on ' and `
                registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = false,      -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = true,       -- default bindings on <c-w>
                    nav = true,           -- misc bindings to work with windows
                    z = false,            -- bindings for folds, spelling and others prefixed with z
                    g = false,            -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            -- operators = { gc = "Comments" },
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<cr>"] = "RET",
                -- ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+",      -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>",   -- binding to scroll up inside the popup
            },
            window = {
                border = "rounded",       -- none, single, double, shadow
                position = "bottom",      -- bottom, top
                margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 },                                           -- min and max height of the columns
                width = { min = 20, max = 50 },                                           -- min and max width of the columns
                spacing = 3,                                                              -- spacing between columns
                align = "left",                                                           -- align columns left, center or right
            },
            ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true,                                                             -- show help message on the command line when the popup is visible
            triggers = "auto",                                                            -- automatically setup triggers
            -- triggers = {"<leader>"} -- or specify a list manually
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for key maps that start with a native binding
                -- most people should not need to change this
                i = { "j", "k" },
                v = { "j", "k" },
            },
        }

        local opts = {
            mode = "n",     -- NORMAL mode
            prefix = "<Space>",
            buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true,  -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true,  -- use `nowait` when creating keymaps
        }

        local mappings = {
            ["a"] = { "<cmd>Alpha<cr>", "Welcome" },
            ["r"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            ["p"] = { "<cmd>Telescope projects<cr>", "Recent Projects" },

            g = {
                name = "Git",
                o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
                C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
            },

            -- l = {
            --     name = "LSP",
            --     l = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            --     d = {
            --         "<cmd>Telescope lsp_document_diagnostics<cr>",
            --         "Document Diagnostics",
            --     },
            --     w = {
            --         "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            --         "Workspace Diagnostics",
            --     },
            --     f = { "<cmd>Format<cr>", "Format" },
            --     i = { "<cmd>LspInfo<cr>", "Info" },
            --     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
            --     j = {
            --         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            --         "Next Diagnostic",
            --     },
            --     k = {
            --         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            --         "Prev Diagnostic",
            --     },
            --     q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
            --     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            --     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            --     S = {
            --         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            --         "Workspace Symbols",
            --     },
            -- },

            -- c = {
            --     name = "Colorscheme",
            --     s = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
            --     p = {
            --         "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            --         "Colorscheme with Preview",
            --     },
            -- },

            s = {
                name = "Search",
                f = { "<cmd>Telescope find_files<cr>", "Find File" },
                H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
                -- H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
                M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                R = { "<cmd>Telescope registers<cr>", "Registers" },
                t = { "<cmd>Telescope live_grep<cr>", "Text" },
                k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                C = { "<cmd>Telescope commands<cr>", "Commands" },
                l = { "<cmd>Telescope resume<cr>", "Resume last search" },
            },


            t = {
                name = "Terminal",
                f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
                h = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Horizontal" },
                v = { "<cmd>ToggleTerm direction=vertical size=80<cr>", "Vertical" },
            },
        }

        which_key.setup(setup)
        which_key.register(mappings, opts)
    end
}
