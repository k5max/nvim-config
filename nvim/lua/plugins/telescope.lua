return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            telescope.setup{
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            preview_cutoff = 0,
                        },
                    },
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
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        hidden = true,
                        -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                    git_files = {
                        theme = "dropdown",
                        previewer = false,
                        show_untracked = true,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                    },
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

            local builtin = require('telescope.builtin')

            -- find
            -- cache the results of "git rev-parse", process creation is expensive in Windows, so this reduces latency
            local is_inside_work_tree = {}
            vim.keymap.set("n", "<leader>ff", function()
                local cwd = vim.fn.getcwd()
                if is_inside_work_tree[cwd] == nil then
                    vim.fn.system("git rev-parse --is-inside-work-tree")
                    is_inside_work_tree[cwd] = vim.v.shell_error == 0
                end

                if is_inside_work_tree[cwd] then
                    builtin.git_files()
                else
                    builtin.find_files()
                end
            end, { noremap = true, silent = true, desc = "Find files"})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Live Grep" }) -- 环境里要安装ripgrep
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { noremap = true, silent = true, desc = "Recent Files"})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Find Buffers" })
            vim.keymap.set("n", "<leader>fB", builtin.current_buffer_fuzzy_find, { noremap = true, silent = true, desc = "Current Buffer Fuzzy Find "})
            vim.keymap.set("n", "<leader>fj", builtin.jumplist, { noremap = true, silent = true, desc = "Jumplist" })
            vim.keymap.set("n", "<leader>fl", builtin.search_history, { noremap = true, silent = true, desc = "Search History" })
            vim.keymap.set("n", "<leader>fL", builtin.command_history, { noremap = true, silent = true, desc = "Command History" })
            vim.keymap.set("n", "<leader>fm", require('telescope').extensions.vim_bookmarks.current_file, { noremap = true, silent = true, desc = "Document Bookmarks"})
            vim.keymap.set("n", "<leader>fM", require('telescope').extensions.vim_bookmarks.all, { noremap = true, silent = true, desc = "Workspace Bookmarks" })
            vim.keymap.set("n", "<leader>fr", builtin.registers, { noremap = true, silent = true, desc = "Find Registers" })
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, { noremap = true, silent = true, desc = "Quickfix List" })
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { noremap = true, silent = true, desc = "Lsp Document Symbols" })
            vim.keymap.set("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { noremap = true, silent = true, desc = "Lsp Dynamic Workspace Rymbols" })
            vim.keymap.set("n", "<leader>fp", '<cmd>Telescope projects<cr>', { noremap = true, silent = true, desc = "Find Projects" })
            vim.keymap.set("n", "<leader>fd", '<cmd>Telescope diagnostics bufnr=0<cr>', { noremap = true, silent = true, desc = "Document Diagnostics"})
            vim.keymap.set("n", "<leader>fD", '<cmd>Telescope diagnostics<cr>', { noremap = true, silent = true, desc = "Workspace Diagnostics"})
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { noremap = true, silent = true, desc = "Keymaps" })
            vim.keymap.set("n", "<leader>fc", builtin.commands, { noremap = true, silent = true, desc = "Commands" })
            vim.keymap.set("n", "<leader>fa", builtin.autocommands, { noremap = true, silent = true, desc = "Autocommands" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Help Tags" })
            vim.keymap.set("n", "<leader>fH", builtin.man_pages, { noremap = true, silent = true, desc = "Man Pages" })
            -- git
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { noremap = true, silent = true, desc = "Checkout Commit" })
            vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { noremap = true, silent = true, desc = "Checkout Commit(fot current file)" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { noremap = true, silent = true, desc = "Checkout Branch" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { noremap = true, silent = true, desc = "Open Changed File" })

            -- 加载外部的一些插件
            require("telescope").load_extension("vim_bookmarks")
            require("telescope").load_extension("projects")
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
