return {
    "vim-scripts/ReplaceWithRegister",
    config = function()
        local opt = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", opt)
        vim.keymap.set("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", opt)
        vim.keymap.set("v", "<leader>r", "<Plug>ReplaceWithRegisterVisual", opt)
    end,
}
