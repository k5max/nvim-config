return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            -- 安装 language parser   :tsinstallinfo 命令查看支持的语言
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {"c", "cpp", "rust", "java", "kotlin", "python", "go", "javascript", "typescript", "html", "css", "sql", "lua", "vim", "json", "markdown"},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            -- List of parsers to ignore installing (for "all")
            ignore_install = {},

            -- 启用代码高亮模块
            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                disable = {},
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            -- 启用增量选择模块
            -- incremental_selection = {
            --     enable = true,
            --     keymaps = {
            --         init_selection = "<cr>",
            --         node_incremental = "<cr>",
            --         node_decremental = "<bs>",
            --         scope_incremental = "<tab>",
            --     },
            -- },
            -- 启用代码缩进模块 (=)
            indent = {
                enable = true,
            },
        })

        -- 开启 Folding 模块 ==> zc，zo 会折叠/取消折叠 {} 里的内容
        vim.o.foldmethod = 'expr'
        vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
}
