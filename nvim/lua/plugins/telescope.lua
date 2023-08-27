return {
    {
        -- telescope => 文件搜索
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            telescope.setup{
                defaults = {
                    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
                    initial_mode = "insert",
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                            ["<esc>"] = actions.close,
                        }
                    }
                },
                pickers = {
                    -- 内置 pickers 配置
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        -- find_command = {"fd"}
                    }
                },
                extensions = {
                    -- 扩展插件配置，格式如下。 please take a look at the readme of the extension you want to configure
                    -- extension_name = {
                    --     extension_config_key = value,
                    -- }

                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    }
                }
            }

            -- 快捷键绑定
            local builtin = require('telescope.builtin')
            local opt = {
                noremap = true,
                silent = true
            }
            vim.keymap.set('n', '<leader>ff', builtin.find_files, opt)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, opt) -- 环境里要安装ripgrep
            vim.keymap.set('n', '<leader>fb', builtin.buffers, opt)
            vim.keymap.set('n', '<leader>fc', builtin.commands, opt)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, opt)
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, opt)
            vim.keymap.set('n', '<leader>sm', builtin.man_pages, opt)
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, opt)
            vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, opt)
            vim.keymap.set('n', '<leader>fm', require('telescope').extensions.vim_bookmarks.current_file, opt)
            vim.keymap.set('n', '<leader>fM', require('telescope').extensions.vim_bookmarks.all, opt)
            vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>', opt)
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles, opt)
            vim.keymap.set('n', '<leader>fR', builtin.registers, opt)
            vim.keymap.set('n', '<leader>fl', builtin.resume, opt)

            -- 加载外部的一些插件
            require('telescope').load_extension('vim_bookmarks')
            require("telescope").load_extension('projects')
            require("telescope").load_extension("ui-select")
        end
    },
    {
        -- telescope 和 vim-bookmarks 集成桥梁
        -- The extension provides two new pickers: 
        --     :Telescope vim_bookmarks all   => 已经被上面映射成 <leader>fM
        --     :Telescope vim_bookmarks current_file => 已经被上面映射成 <leader>fm
        "tom-anders/telescope-vim-bookmarks.nvim",
    },
    {
        -- code action ui界面设置
        "nvim-telescope/telescope-ui-select.nvim",
    }
}
