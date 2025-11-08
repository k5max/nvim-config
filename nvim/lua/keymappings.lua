-- 设置leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- 窗口分屏
keymap.set("n", "<leader>sv", "<C-w>v", opt) -- vsplit
keymap.set("n", "<leader>sh", "<C-w>s", opt) -- split
keymap.set("n", "<leader>sc", "<C-w>c", opt) -- close
keymap.set("n", "<leader>so", "<C-w>o", opt) -- close others
-- 窗口导航
keymap.set("n", "<C-h>", "<C-w>h", opt)
keymap.set("n", "<C-j>", "<C-w>j", opt)
keymap.set("n", "<C-k>", "<C-w>k", opt)
keymap.set("n", "<C-l>", "<C-w>l", opt)
-- keymap.set("n", "", "<C-w>p", opt) -- 切换刚才所在的窗口
-- keymap.set("n", "", "<C-w>w", opt) -- 循环切换窗口
-- keymap.set("n", "", "<C-w>t", opt) -- 跳到最顶部窗口
-- keymap.set("n", "", "<C-w>b", opt) -- 跳到最底部窗口
-- 设置窗口大小
keymap.set("n", "<leader>h", "<C-w>5<", opt) -- 减小宽度
keymap.set("n", "<leader>l", "<C-w>5>", opt) -- 增加宽度
keymap.set("n", "<leader>j", "<C-w>5-", opt) -- 减小高度
keymap.set("n", "<leader>k", "<C-w>5+", opt) -- 增加高度
keymap.set("n", "<leader>=", "<C-w>=", opt) -- 等分窗口
keymap.set("n", "<leader>_", "<C-w>_", opt) -- 最大化窗口高度
keymap.set("n", "<leader>|", "<C-w>|", opt) -- 最大化窗口宽度
-- Place the two screens up and down
keymap.set("n", "sh", "<C-w>t<C-w>K", opt)
-- Place the two screens side by side
keymap.set("n", "sv", "<C-w>t<C-w>H", opt)

-- 取消搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", opt)

-- 连续缩进代码
keymap.set("v", "<", "<gv", opt)
keymap.set("v", ">", ">gv", opt)
-- 以下参考: https://vi.stackexchange.com/questions/2674/how-can-i-easily-move-a-line
-- 上下移动文本
keymap.set("n", "<A-j>", ":move .+1<CR>==", opt)
keymap.set("n", "<A-k>", ":move .-2<CR>==", opt)
keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==", opt)
keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==", opt)
-- 上下移动选中文本并保持缩进
keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", opt) -- :move '>+1<CR>gv-gv 不缩进
keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", opt) -- :move '<-2<CR>gv-gv 不缩进

-- Better terminal navigation
-- keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
-- keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
-- keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
-- keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

-- ===== 更多插件相关快捷键在各自的配置文件里面 =====
