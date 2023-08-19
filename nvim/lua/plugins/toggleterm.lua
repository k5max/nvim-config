return {
    -- toggleterm => toggle terminal
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = false,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        function _G.set_terminal_keymaps()
            -- Terminal window navigation
            local opts = {noremap = true}
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        -- NOTE: need to install lazygit first
        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
        function _NCDU_TOGGLE()
            ncdu:toggle()
        end

        local htop = Terminal:new({ cmd = "htop", hidden = true })
        function _HTOP_TOGGLE()
            htop:toggle()
        end


        -- 为 lazygit 添加快捷键绑定
        vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true})
        vim.keymap.set("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<CR>", {noremap = true})
        vim.keymap.set("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<CR>", {noremap = true})
    end
}
