return {
    "vim-scripts/ReplaceWithRegister",
    config = function()
        vim.keymap.set("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", { noremap = true, silent = true, desc = "ReplaceWithRegisterOperator" })
        vim.keymap.set("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", { noremap = true, silent = true, desc = "ReplaceWithRegisterLine" })
        vim.keymap.set("v", "<leader>r", "<Plug>ReplaceWithRegisterVisual", { noremap = true, silent = true, desc = "ReplaceWithRegisterVisual" })
    end,
}
