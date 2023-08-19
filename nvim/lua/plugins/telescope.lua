return {
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
                }
            },
            extensions = {
                -- 扩展插件配置
                -- extension_name = {
                --   extension_config_key = value,
                -- }
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
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, opt)

        -- 加载外部的一些插件
        -- load project extension. see project.lua file
    end
}
