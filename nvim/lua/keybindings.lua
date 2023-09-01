-- 设置leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 500

local keymap = vim.keymap
local opt = { noremap = true, silent = true }
local terminal_opt = { silent = true }

-- ===== normal model =====
-- 窗口分屏
keymap.set("n", "<leader>sv", "<C-w>v", opt) -- vsplit
keymap.set("n", "<leader>sh", "<C-w>s", opt) -- split
keymap.set("n", "<leader>sc", "<C-w>c", opt) -- close
-- hjkl四个方向切换窗口
keymap.set("n", "<C-h>", "<C-w>h", opt)
keymap.set("n", "<C-j>", "<C-w>j", opt)
keymap.set("n", "<C-k>", "<C-w>k", opt)
keymap.set("n", "<C-l>", "<C-w>l", opt)
keymap.set("n", "<C-t>", "<C-w>t", opt) -- 跳到最顶部窗口
--keymap.set("n", "", "<C-w>b", opt)    -- 跳到最底部窗口
-- 设置窗口比例
keymap.set("n", "<leader>h", "<C-w>5<", opt) -- 减小宽度
keymap.set("n", "<leader>l", "<C-w>5>", opt) -- 增加宽度
keymap.set("n", "<leader>j", "<C-w>5-", opt) -- 减小高度
keymap.set("n", "<leader>k", "<C-w>5+", opt) -- 增加高度

-- Place the two screens up and down
keymap.set("n", "sh", "<C-w>t<C-w>K", opt)
-- Place the two screens side by side
keymap.set("n", "sv", "<C-w>t<C-w>H", opt)

-- 取消搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", opt)

-- -- 禁用方向键
-- keymap.set("n", "<Up>", "<Nop>", opt)
-- keymap.set("n", "<Down>", "<Nop>", opt)
-- keymap.set("n", "<Left>", "<Nop>", opt)
-- keymap.set("n", "<Right>", "<Nop>", opt)

-- ===== insert model =====


-- ===== visual model =====
-- 连续缩进代码
keymap.set("v", "<", "<gv", opt)
keymap.set("v", ">", ">gv", opt)
-- 上下移动选中文本并保持缩进
keymap.set("v", "J", ":move '>+1<CR>gv=gv", opt) -- :move '>+1<CR>gv-gv 不缩进
keymap.set("v", "K", ":move '<-2<CR>gv=gv", opt) -- :move '<-2<CR>gv-gv 不缩进

-- ===== terminal model =====
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", terminal_opt)
-- keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", terminal_opt)
-- keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", terminal_opt)
-- keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", terminal_opt)

-- ===== 插件相关快捷键在各自的配置里面 =====
-- nvimtree    => plugin-config/nvimtree.lua
-- telescope   => plugin-config/telescope.lua
-- gitsigns    => plugin-config/gitsigns.lua
-- toggleterm  => plugin-config/toggleterm.lua
-- which-key   => plugin-config/which-key.lua 注意这里面的快捷键不要跟keybingings.lua里面的重复了
-- lsp         => lsp/lsp.lua
-- cmp         => lsp/cmp.lua
