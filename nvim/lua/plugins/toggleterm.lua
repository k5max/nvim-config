return {
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
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal = require("toggleterm.terminal").Terminal
        -- need to install lazygit first
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        -- need to install ncdu first
        local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
        function _NCDU_TOGGLE()
            ncdu:toggle()
        end

        -- need to install htop first
        local htop = Terminal:new({ cmd = "htop", hidden = true })
        function _HTOP_TOGGLE()
            htop:toggle()
        end

        vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { noremap = true, silent = true, desc = "Lazygit Toggle" })
        vim.keymap.set("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", { noremap = true, silent = true, desc = "Ncdu Toggle" })
        vim.keymap.set("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", { noremap = true, silent = true, desc = "Htop Toggle" })
        vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { noremap = true, silent = true, desc = "Terminal Float" })
        vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=10<cr>", { noremap = true, silent = true, desc = "Terminal Horizontal" })
        vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", { noremap = true, silent = true, desc = "Terminal Vertical" })
    end
}
