return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            highlights = {
                buffer_selected = {
                    bold = true,
                    italic = true,
                },
                indicator_selected = {
                    fg = "#B4B4B4",
                },
            },
            options = {
                -- 关闭 buffer 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
                close_command = "Bdelete! %d",
                left_mouse_command = "buffer %d",
                right_mouse_command = "Bdelete! %d",
                indicator = {
                    icon = '▎',
                    style = 'icon',
                },
                max_name_length = 30,
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
                diagnostics = "nvim_lsp",
                -- 可选，显示 LSP 报错图标
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
            },
        })

        vim.keymap.set("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", {noremap = true, silent = true, desc = "Telescope Buffers" })
        -- 关闭 使用"moll/vim-bbye"
        vim.keymap.set("n", "<leader>bc", "<cmd>Bdelete!<cr>", {noremap = true, silent = true, desc = "Close Buffer" })
        vim.keymap.set("n", "<leader>bC", "<cmd>BufferLinePickClose<cr>", {noremap = true, silent = true, desc = "Cloce Pick Buffer" })
        vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", {noremap = true, silent = true, desc = "Close Other Buffers" })
        vim.keymap.set("n", "<leader>bg", "<cmd>BufferLinePick<cr>", {noremap = true, silent = true, desc = "Pick Buffer" })
        vim.keymap.set("n", "<leader>bk", "<cmd>BufferLineCyclePrev<cr>", {noremap = true, silent = true, desc = "Select Prev Buffer" })
        vim.keymap.set("n", "<leader>bj", "<cmd>BufferLineCycleNext<cr>", {noremap = true, silent = true, desc = "Select Next Buffer" })
        vim.keymap.set("n", "<leader>bK", "<cmd>BufferLineMovePrev<cr>", {noremap = true, silent = true, desc = "Move Buffer Prev" })
        vim.keymap.set("n", "<leader>bJ", "<cmd>BufferLineMoveNext<cr>", {noremap = true, silent = true, desc = "Move Buffer Pext" })
        vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", {noremap = true, silent = true, desc = "Close Right Buffer" })
        vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", {noremap = true, silent = true, desc = "Close Left Buffers" })
        vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", {noremap = true, silent = true, desc = "Toggle Pin Buffers" })
        vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", {noremap = true, silent = true, desc = "Close Non-Pinned Buffers" })
    end
}
