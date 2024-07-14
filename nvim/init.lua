-- 基础设置
require("basic")
-- 快捷键映射
require("keymappings")
-- 自动命令
require("autocmds")
-- 剪贴板设置
require("clipboard")
-- lazynvim 插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    vim.notify("lazy.nvim not found")
    return
end
-- 加载所有插件
lazy.setup("plugins")
