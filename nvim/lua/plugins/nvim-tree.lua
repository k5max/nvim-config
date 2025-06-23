return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        -- https://github.com/kyazdani42/nvim-tree.lua
        --
        -- <CR> or o on the root folder will cd in the above directory
        -- <C-]> will cd in the directory under the cursor
        -- <BS> will close current opened directory or parent
        -- type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
        -- you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
        --
        -- type r to rename a file
        -- type <C-r> to rename a file and omit the filename on input
        -- type x to add/remove file/directory to cut clipboard
        -- type c to add/remove file/directory to copy clipboard
        -- type y will copy name to system clipboard
        -- type Y will copy relative path to system clipboard
        -- type gy will copy absolute path to system clipboard
        -- type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
        -- type d to delete a file (will prompt for confirmation)
        -- type D to trash a file (configured in setup())
        -- type ]c to go to next git item
        -- type [c to go to prev git item
        -- type - to navigate up to the parent directory of the current file/directory
        -- type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
        -- if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
        -- if the file is a symlink, <CR> will follow the symlink (if the target is a file)
        -- <C-v> will open the file in a vertical split
        -- <C-x> will open the file in a horizontal split
        -- <C-t> will open the file in a new tab
        -- <Tab> will open the file as a preview (keeps the cursor in the tree)
        -- I will toggle visibility of hidden folders / files which are defined by gitignores
        -- D will toggle visibility of dotfiles (files/folders starting with a .)
        -- R will refresh the tree
        -- Double left click acts like <CR>
        -- Double right click acts like <C-]>
        -- W will collapse the whole tree
        -- S will prompt the user to enter a path and then expands the tree to match the path
        -- . will enter vim command mode with the file the cursor is on
        -- C-k will toggle a popup with file infos about the file under the cursor

        local nvim_tree = require("nvim-tree")
        nvim_tree.setup({
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_netrw = true,
            open_on_tab = false,
            hijack_cursor = false,
            update_cwd = true,
            -- 排序规则
            sort_by = "case_sensitive",
            -- 显示 git 状态图标
            git = {
                enable = true,
                ignore = true,
                timeout = 100,
            },
            renderer = {
                group_empty = true,
                -- 隐藏根目录
                root_folder_label = false,
            },
            filters = {
                -- 隐藏.文件 
                dotfiles = false,
                -- 自定义隐藏文件夹
                custom = { '^.git$' },
                exclude = {},
            },
            view = {
                -- 宽度
                width = 30,
                -- 也可以 "right"
                side = "left",
                -- 不显示行数
                number = false,
                relativenumber = false,
                -- 显示图标
                signcolumn = "yes",
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = false,
                ignore_list = {},
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {},
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                open_file = {
                    -- 首次打开大小适配
                    resize_window = true,
                    -- 打开文件时关闭
                    quit_on_open = false,
                },
            },
            -- trash = {
            --     cmd = "trash",
            --     require_confirm = true,
            -- },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    diagnostics = false,
                    git = false,
                    profile = false,
                },
            },
        })

        vim.g.nvim_tree_icons = {
            default = "",
            symlink = "",
            git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "U",
                ignored = "◌",
            },
            folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
            },
        }

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "NvimTreeToggle" })
        vim.keymap.set("n", "<leader>m", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "NvimTreeFindFile" })

        -- 新建文件后自动打开
        local api = require("nvim-tree.api")
        api.events.subscribe(api.events.Event.FileCreated, function(file)
            vim.cmd("edit " .. file.fname)
        end)

        -- 自动关闭
        vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])
    end
}
