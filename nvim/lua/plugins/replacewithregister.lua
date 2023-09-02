return {
    "vim-scripts/ReplaceWithRegister",
    config = function()
        local opt = { noremap = true, silent = true }
        vim.keymap.set("n", "rs", "<Plug>ReplaceWithRegisterOperator", opt)
        vim.keymap.set("n", "rss", "<Plug>ReplaceWithRegisterLine", opt)
        vim.keymap.set("v", "rs", "<Plug>ReplaceWithRegisterVisual", opt)
    end,
}
