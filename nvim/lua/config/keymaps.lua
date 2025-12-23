-- 设置leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- 窗口分屏
keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Vertical Split Window" }) -- vsplit
keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Horizontal Split Window" }) -- split
keymap.set("n", "<leader>sc", "<C-w>c", { noremap = true, silent = true, desc = "Close Window" }) -- close
keymap.set("n", "<leader>so", "<C-w>o", { noremap = true, silent = true, desc = "Close Other Windows" }) -- close others
-- 窗口导航
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to Left Window" })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Go to Lower Window" })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Go to Upper Window" })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to Right Window" })
-- keymap.set("n", "", "<C-w>p", { noremap = true, silent = true, desc = "Go to Previous Window" }) -- 切换前一个窗口
-- keymap.set("n", "", "<C-w>w", { noremap = true, silent = true, desc = "Loop Switch Window" }) -- 循环切换窗口
-- keymap.set("n", "", "<C-w>t", { noremap = true, silent = true, desc = "Go to Top Window" }) -- 跳到最顶部窗口
-- keymap.set("n", "", "<C-w>b", { noremap = true, silent = true, desc = "Go to Bottom Window" }) -- 跳到最底部窗口
-- 设置窗口大小
keymap.set("n", "<leader>h", "<C-w>2<", { noremap = true, silent = true, desc = "Decrease Window Width" }) -- 减小宽度
keymap.set("n", "<leader>l", "<C-w>2>", { noremap = true, silent = true, desc = "Increase Window Width" }) -- 增加宽度
keymap.set("n", "<leader>j", "<C-w>2-", { noremap = true, silent = true, desc = "Decrease Window Height" }) -- 减小高度
keymap.set("n", "<leader>k", "<C-w>2+", { noremap = true, silent = true, desc = "Increase Window Height" }) -- 增加高度
keymap.set("n", "<leader>=", "<C-w>=", { noremap = true, silent = true, desc = "Aliquot Window" }) -- 等分窗口
keymap.set("n", "<leader>_", "<C-w>_", { noremap = true, silent = true, desc = "Maximize Window Height" }) -- 最大化窗口高度
keymap.set("n", "<leader>|", "<C-w>|", { noremap = true, silent = true, desc = "Maximize Window Width" }) -- 最大化窗口宽度
-- Place the two screens up and down
keymap.set("n", "sh", "<C-w>t<C-w>K", { noremap = true, silent = true, desc = "Vertical to Horizontal" }) -- 垂直改水平（两个窗口）
-- Place the two screens side by side
keymap.set("n", "sv", "<C-w>t<C-w>H", { noremap = true, silent = true, desc = "Horizontal To Vertical" }) -- 水平改垂直（两个窗口）

-- 取消搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "No Higtlight" })

-- 连续缩进代码
keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent" })
keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Unindent" })
-- 以下参考: https://vi.stackexchange.com/questions/2674/how-can-i-easily-move-a-line
-- 上下移动文本
keymap.set("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true, desc = "Move Line Down" })
keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true, desc = "Move Line Up" })
keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==", { noremap = true, silent = true, desc = "Move Line Down" })
keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==", { noremap = true, silent = true, desc = "Move Line Up" })
-- 上下移动选中文本并保持缩进
keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move Selection Down" }) -- :move '>+1<CR>gv-gv 不缩进
keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move Selection Up" }) -- :move '<-2<CR>gv-gv 不缩进

-- ===== 更多插件相关快捷键在各自的配置文件里面 =====
