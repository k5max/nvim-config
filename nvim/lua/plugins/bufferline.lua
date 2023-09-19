return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                -- 侧边栏配置
                -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
                -- 使用 nvim 内置 LSP  后续课程会配置
                diagnostics = "nvim_lsp",
                -- 可选，显示 LSP 报错图标
                ---@diagnostic disable-next-line: unused-local
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
            },
        })

        -- 快捷键映射
        local opt = {
            noremap = true,
            silent = true
        }
        vim.keymap.set("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", opt)
        -- 关闭 使用"moll/vim-bbye"
        vim.keymap.set("n", "<leader>bc", "<cmd>Bdelete!<cr>", opt)
        vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", opt)
        vim.keymap.set("n", "<leader>bg", "<cmd>BufferLinePick<cr>", opt)
        vim.keymap.set("n", "<leader>bk", "<cmd>BufferLineCyclePrev<cr>", opt)
        vim.keymap.set("n", "<leader>bj", "<cmd>BufferLineCycleNext<cr>", opt)
        vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", opt)
        vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", opt)
        vim.keymap.set("n", "<leader>bC", "<cmd>BufferLinePickClose<cr>", opt)

    end
}
