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
    -- O and o, don't continue comments, but do continue when pressing enter.
    vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r"
  end,
})
