-- utf8
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"

-- 打通系统剪贴板
vim.opt.clipboard = "unnamedplus,unnamed"
-- 行号与相对行号
vim.opt.number = true
--vim.opt.relativenumber = true
-- 处理未保存或只读文件弹出提示
vim.opt.confirm = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- Tab缩进等于4个空格
vim.opt.tabstop = 4
vim.bo.tabstop = 4
-- 连续按Backspace时删掉4个空格
vim.opt.softtabstop = 4
-- 缩进取整
vim.opt.shiftround = true
-- 每级缩进的宽度为4个空格
vim.opt.shiftwidth = 4
vim.bo.shiftwidth = 4
-- Tab转换为空格
vim.opt.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.opt.autoindent = true
vim.bo.autoindent = true
vim.opt.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索高亮
vim.opt.hlsearch = true
-- 边输入边搜索
vim.opt.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.opt.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.opt.hidden = true
-- 鼠标支持
vim.opt.mouse = "a"
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- smaller updatetime
vim.opt.updatetime = 300
-- 设置 timeoutlen 和 ttimeoutlen
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 25
-- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.opt.background = "dark" -- light or dark
vim.opt.termguicolors = true
-- 补全增强
vim.opt.wildmenu = true
-- Don't pass messages to |ins-completin menu|
vim.opt.shortmess = vim.opt.shortmess + "c"
-- 补全最多显示10行
vim.opt.pumheight = 10
-- 永远显示 tabline
vim.opt.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false
-- cursor style  default "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
