return {
    -- treesitter => 语法高亮
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            -- 安装 language parser
            -- :tsinstallinfo 命令查看支持的语言
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
            -- rainbow = {
            --     enable = true,
            --     -- disable = { "cpp" }, list of languages you want to disable the plugin for
            --     extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            --     max_file_lines = nil, -- do not enable for files with more than n lines, int
            --     colors = {
            --         "#95ca60",
            --         "#ee6985",
            --         "#d6a760",
            --         "#7794f4",
            --         "#b38bf5",
            --         "#7cc7fe",
            --     }, -- table of hex strings
            --     -- termcolors = { } -- table of colour name strings
            -- },
        })

        -- 快捷键绑定
        -- 开启 Folding 模块 ==> zc，zo 会折叠 {} 里的内容
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        -- 默认不要折叠
        vim.opt.foldlevel = 99
    end
}
