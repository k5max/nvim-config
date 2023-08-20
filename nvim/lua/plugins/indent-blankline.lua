return {
    -- indent-blankline
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local indent_blankline = require("indent_blankline")
        vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
        vim.g.indent_blankline_filetype_exclude = {
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
        }
        vim.g.indentLine_enabled = 1
        -- vim.g.indent_blankline_char = "│"
        vim.g.indent_blankline_char = "▏"
        -- vim.g.indent_blankline_char = "▎"
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = true
        vim.g.indent_blankline_use_treesitter = true
        vim.g.indent_blankline_show_current_context = true
        vim.g.indent_blankline_context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type",
        }
        -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
        vim.wo.colorcolumn = "99999"

        -- 彩色行高亮
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
        -- vim.opt.list = true
        -- vim.opt.listchars:append "space:⋅" -- 空格加.
        -- vim.opt.listchars:append "eol:↴" -- 行尾小换行

        indent_blankline.setup({
            -- show_end_of_line = true,
            space_char_blankline = " ",
            show_current_context = true,
            -- show_current_context_start = true,
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                -- "IndentBlanklineIndent4",
                -- "IndentBlanklineIndent5",
                -- "IndentBlanklineIndent6",
            },
        })
    end
}