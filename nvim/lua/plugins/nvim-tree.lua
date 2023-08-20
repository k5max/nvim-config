return {
    -- vim-tree + nvim-web-devicons => 文件树 + 图标
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        local nvim_tree = require("nvim-tree")
        nvim_tree.setup({
            -- 排序规则
            sort_by = "case_sensitive",
            -- 不显示 git 状态图标
            git = {
                enable = false,
            },
            renderer = {
                group_empty = true,
            },
            -- 隐藏 .文件 
            filters = {
                dotfiles = false,
                -- 自定义隐藏文件夹
                custom = { '^.git$' }
            },
            view = {
                -- 宽度
                width = 40,
                -- 也可以 'right'
                side = 'left',
                -- 隐藏根目录
                hide_root_folder = false,
                -- 不显示行数
                number = false,
                relativenumber = false,
                -- 显示图标
                signcolumn = 'yes',
            },
            actions = {
                open_file = {
                    -- 首次打开大小适配
                    resize_window = true,
                    -- 打开文件时关闭
                    quit_on_open = false,
                },
            },
        })

        -- 快捷键绑定
        local opt = {
            noremap = true,
            silent = true
        }
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
        vim.keymap.set("n", "<leader>m", ":NvimTreeFindFile<CR>", opt)

        -- 自动关闭
        vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])
    end
}
