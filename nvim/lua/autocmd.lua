local autocmd = vim.api.nvim_create_autocmd
-- Highlight on yank
autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank({
            timeout = 300,
        })
    end,
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
    group = myAutoGroup,
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions
        - "o" -- O and o, don't continue comments
        + "r" -- But do continue when pressing enter.
    end,
})
