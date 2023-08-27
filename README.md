# neovim 配置

## 目录结构

```
nvim
├── init.lua
├── lazy-lock.json
└── lua
    ├── autocmd.lua
    ├── basic.lua
    ├── keybindings.lua
    ├── lsp
    │   ├── clangd.lua
    │   ├── lua.lua
    │   ├── pyright.lua
    │   └── tsserver.lua
    └── plugins
        ├── alpha.lua
        ├── bufferline.lua
        ├── cmp.lua
        ├── colorscheme.lua
        ├── comment.lua
        ├── copilot.lua
        ├── gitsigns.lua
        ├── im-select.lua
        ├── indent-blankline.lua
        ├── leap.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── neovim-session-manager.lua
        ├── nvim-autopairs.lua
        ├── nvim-surround.lua
        ├── nvim-tree.lua
        ├── nvim-treesitter.lua
        ├── project.lua
        ├── symbols-outline.lua
        ├── telescope.lua
        ├── toggleterm.lua
        ├── vim-bookmarks.lua
        └── which-key.lua
```

init.lua -- init文件

autocmd.lua -- neovim 自动命令

basic.lua -- neovim 基本配置

keybindings.lua -- neovim 基本快捷键配置

lsp -- lsp配置文件所在目录

plugins -- 插件文件配置所在目录



## 插件列表

### plugin manager

| plugin    | desc                                                 | url                                |
| --------- | ---------------------------------------------------- | ---------------------------------- |
| lazy.nvim | **lazy.nvim** is a modern plugin manager for Neovim. | https://github.com/folke/lazy.nvim |



### common

| plugin                | desc                                                         | url                                                    |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------ |
| alpha-nvim            | `alpha` is a fast and fully programmable greeter for neovim. | https://github.com/goolord/alpha-nvim                  |
| bufferline.nvim       | A *snazzy* 💅 buffer line (with tabpage integration) for Neovim built using **lua**. | https://github.com/akinsho/bufferline.nvim             |
| Comment.nvim          | Smart and Powerful commenting plugin for neovim              | https://github.com/numToStr/Comment.nvim               |
| gitsigns.nvim         | Super fast git decorations implemented purely in Lua.        | https://github.com/lewis6991/gitsigns.nvim             |
| indent-blankline.nvim | This plugin adds indentation guides to all lines (including empty lines). | https://github.com/lukas-reineke/indent-blankline.nvim |
| leap.nvim             | Leap is a general-purpose motion plugin for Neovim           | https://github.com/ggandor/leap.nvim                   |
| lualine.nvim          | A blazing fast and easy to configure Neovim statusline written in Lua. | https://github.com/nvim-lualine/lualine.nvim           |
| nvim-autopairs        | A super powerful autopair plugin for Neovim that supports multiple characters. | https://github.com/windwp/nvim-autopairs               |
| nvim-tree.lua         | A File Explorer For Neovim Written In Lua                    | https://github.com/nvim-tree/nvim-tree.lua             |
| nvim-treesitter       | Treesitter configurations and abstraction layer for Neovim.  | https://github.com/nvim-treesitter/nvim-treesitter     |
| project.nvim          | project.nvim is an all in one neovim plugin written in lua that provides superior project management. | https://github.com/ahmedkhalf/project.nvim             |
| symbols-outline.nvim  | A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages. | https://github.com/simrat39/symbols-outline.nvim       |
| telescope.nvim        | `telescope.nvim` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from `neovim` core. | https://github.com/nvim-telescope/telescope.nvim       |
| toggleterm.nvim       | A *neovim* plugin to persist and toggle multiple terminals during an editing session | https://github.com/akinsho/toggleterm.nvim             |
| which-key.nvim        | **WhichKey** is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing. | https://github.com/folke/which-key.nvim                |



### lsp + cmp

| plugin               | desc                                                         | url                                                  |
| -------------------- | ------------------------------------------------------------ | ---------------------------------------------------- |
| nvim-lspconfig       | Configs for the Nvim LSP client                              | https://github.com/neovim/nvim-lspconfig             |
| mason.nvim           | Portable package manager for Neovim that runs everywhere Neovim runs.Easily install and manage LSP servers, DAP servers, linters, and formatters. | https://github.com/williamboman/mason.nvim           |
| mason-lspconfig.nvim | mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together. | https://github.com/williamboman/mason-lspconfig.nvim |
| nvim-cmp             | A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced". | https://github.com/hrsh7th/nvim-cmp                  |



## 快捷键

### 改键后快捷键

| command          | keybinding  | origin        | model  |
| ---------------- | ----------- | ------------- | ------ |
| 垂直分屏         | \<leader>sv | \<C-w>v       | normal |
| 水平分屏         | \<leader>sh | \<C-w>s       | normal |
| 关闭当前窗口     | \<leader>sc | \<C-w>c       | normal |
| 关标跳到左边窗口 | \<C-h>      | \<C-w>h       | normal |
| 关标跳到下边窗口 | \<C-j>      | \<C-w>j       | normal |
| 关标跳到上边窗口 | \<C-k>      | \<C-w>k       | normal |
| 关标跳到右边窗口 | \<C-l>      | \<C-w>l       | normal |
| 跳到最顶部窗口   | \<C-t>      | \<C-w>t       | normal |
| 减小5行宽度      | \<leader>h  | \<C-w>5<      | normal |
| 增加5行宽度      | \<leader>l  | \<C-w>5>      | normal |
| 减小5行高度      | \<leader>j  | \<C-w>5-      | normal |
| 增加5行高度      | \<leader>k  | \<C-w>5+      | normal |
| 取消搜索高亮     | \<leader>nh | :nohl\<CR>    | normal |
| 下移选中的文本   | J           | >+1\<CR>gv-gv | visual |
| 上移选中的文本   | K           | <-2\<CR>gv-gv | visual |



### 插件快捷键

更多关于插件的快捷键设置请浏览对应的官方 Repository 



#### alpha-nvim

| command    | keybinding | plugin     | model  |
| ---------- | ---------- | ---------- | ------ |
| 打开欢迎页 | \<leader>a | alpha-nvim | normal |



#### bufferline

| command               | keybinding  | plugin          | model  |
| --------------------- | ----------- | --------------- | ------ |
| 选择一个buffer跳转    | \<leader>bg | bufferline.nvim | normal |
| 用telescope查找buffer | \<leader>bf | bufferline.nvim | normal |
| 下一个buffer          | \<leader>bj | bufferline.nvim | normal |
| 上一个buffer          | \<leader>bk | bufferline.nvim | normal |
| 关闭buffer            | \<leader>bc | bufferline.nvim | normal |
| 选择一个buffer关闭    | \<leader>bC | bufferline.nvim | normal |
| 关闭所有左侧的buffer  | \<leader>bh | bufferline.nvim | normal |
| 关闭所有右侧的buffer  | \<leader>bl | bufferline.nvim | normal |



#### nvim-tree

| command                     | keybinding | plugin    | model  |
| --------------------------- | ---------- | --------- | ------ |
| 打开/关闭File Explorer      | \<leader>e | nvim-tree | normal |
| File Explorer中定位当前文件 | \<leader>m | nvim-tree | normal |
| 创建文件                    | a          | nvim-tree | normal |
| 删除文件                    | d          | nvim-tree | normal |
| 重命名文件                  | r          | nvim-tree | normal |
| 复制文件                    | c          | nvim-tree | normal |
| 粘贴文件                    | p          | nvim-tree | normal |
| 剪切文件                    | x          | nvim-tree | normal |



#### symbols-outline

| command       | keybinding | plugin               | model  |
| ------------- | ---------- | -------------------- | ------ |
| 打开/关闭大纲 | \<leader>o | symbols-outline.nvim | normal |



#### vim-bookmarks

| command                           | keybinding | plugin        | model  |
| --------------------------------- | ---------- | ------------- | ------ |
| 在当前行添加/删除书签             | mm         | vim-bookmarks | normal |
| 在当前行添加/编辑/删除 annotation | mi         | vim-bookmarks | normal |
| 跳转到缓冲区中的下一个书签        | mn         | vim-bookmarks | normal |
| 跳转到缓冲区中的上一个书签        | mp         | vim-bookmarks | normal |
| 显示所有书签（单独窗口）          | ma         | vim-bookmarks | normal |
| 仅清除当前缓冲区中的书签          | mc         | vim-bookmarks | normal |
| 清除所有缓冲区中的书签            | mx         | vim-bookmarks | normal |



#### telescope

| command                               | keybinding  | plugin         | model  |
| ------------------------------------- | ----------- | -------------- | ------ |
| find files                            | \<leader>ff | telescope.nvim | normal |
| live grep                             | \<leader>fg | telescope.nvim | normal |
| buffers                               | \<leader>fb | telescope.nvim | normal |
| commands                              | \<leader>fc | telescope.nvim | normal |
| help_tags                             | \<leader>fh | telescope.nvim | normal |
| keymaps                               | \<leader>fk | telescope.nvim | normal |
| man_pages                             | \<leader>sm | telescope.nvim | normal |
| lsp_document_symbols                  | \<leader>fs | telescope.nvim | normal |
| lsp_dynamic_workspace_symbols         | \<leader>fS | telescope.nvim | normal |
| extentions.vim_bookmarks.current_file | \<leader>fm | telescope.nvim | normal |
| extentions.vim_bookmarks.all          | \<leader>fM | telescope.nvim | normal |
| :Telescope projects                   | \<leader>fp | telescope.nvim | normal |
| oldfiles                              | \<leader>fr | telescope.nvim | normal |
| registers                             | \<leader>fR | telescope.nvim | normal |
| resume                                | \<leader>fl | telescope.nvim | normal |
| telescope弹窗内左移光标               | \<C-h>      | telescope.nvim | insert |
| telescope弹窗内下移光标               | \<C-j>      | telescope.nvim | insert |
| telescope弹窗内上移光标               | \<C-k>      | telescope.nvim | insert |
| telescope弹窗内右移光标               | \<C-l>      | telescope.nvim | insert |
| telescope弹窗内容向上滚动             | \<C-u>      | telescope.nvim | insert |
| telescope弹窗内容向下滚动             | \<C-d>      | telescope.nvim | insert |
| telescope关闭弹窗                     | \<esc>      | telescope.nvim | insert |



#### toggleterm

| command            | keybinding  | plugin          | model    |
| ------------------ | ----------- | --------------- | -------- |
| 打开toggleterm终端 | <C-\\>      | toggleterm.nvim | normal   |
| 光标跳到左边终端中 | \<C-h>      | toggleterm.nvim | terminal |
| 光标跳到下边终端中 | \<C-j>      | toggleterm.nvim | terminal |
| 光标跳到上边终端中 | \<C-k>      | toggleterm.nvim | terminal |
| 光标跳到右边终端中 | \<C-l>      | toggleterm.nvim | terminal |
| 终端进入normal模式 | \<esc>      | toggleterm.nvim | terminal |
| 打开Lazygit        | \<leader>gg | toggleterm.nvim | normal   |
| 打开NCDU           | \<leader>tu | toggleterm.nvim | normal   |
| 打开htop           | \<leader>tt | toggleterm.nvim | normal   |



#### nvim-lspconfig

这些都需要先安装 lsp 服务器

| command                       | keybinding        | plugin         | model  |
| ----------------------------- | ----------------- | -------------- | ------ |
| vim.lsp.buf.declaration       | gD                | nvim-lspconfig | normal |
| vim.lsp.buf.definition        | gd                | nvim-lspconfig | normal |
| vim.lsp.buf.hover             | gh                | nvim-lspconfig | normal |
| vim.lsp.buffer.implementation | gi                | nvim-lspconfig | normal |
| vim.lsp.buf.references        | gr                | nvim-lspconfig | normal |
| vim.lsp.buf.type_definition   | \<leader>D        | nvim-lspconfig | normal |
| vim.lsp.buf.rename            | \<leader>rn       | nvim-lspconfig | normal |
| vim.lsp.buf.code_action       | \<leader>ca       | nvim-lspconfig | normal |
| lsp格式化                     | \<leader>f        | nvim-lspconfig | normal |
| 浮动窗口打开错误提示          | \<space>df        | nvim-lspconfig | normal |
| 跳到上一个错误                | [d                | nvim-lspconfig | normal |
| 跳到下一个错误                | ]d                | nvim-lspconfig | normal |
| 打开/关闭诊断错误列表         | \<space>q         | nvim-lspconfig | normal |



#### nvim-cmp

| command                              | keybinding | plugin       | model      |
| ------------------------------------ | ---------- | ------------ | ---------- |
| 选中下一个补全提示信息               | \<C-j>     | nvim-cmp     | insert     |
| 选中上一个补全提示信息               | \<C-k>     | nvim-cmp     | insert     |
| 向前翻4个补全提示信息                | \<C-u>     | nvim-cmp     | insert     |
| 向后翻4个补全提示信息                | \<C-d>     | nvim-cmp     | insert     |
| 退出补全（esc也可退出）              | \<C-e>     | nvim-cmp     | insert     |
| ~~选中下一个补全提示信息（未使用）~~ | ~~\<Tab>~~ | ~~nvim-cmp~~ | ~~insert~~ |
| 选中上一个补全提示信息               | \<S-Tab>   | nvim-cmp     | insert     |
| 选中当前补全提示                     | \<CR>      | nvim-cmp     | insert     |



#### Comment

| command  | keybinding | plugin       | model         |
| -------- | ---------- | ------------ | ------------- |
| 注释单行 | gcc        | Comment.nvim | normal,visual |
| 注释多行 | gc         | Comment.nvim | normal,visual |



#### gitsigns

| command                            | keybinding  | plugin        | model  |
| ---------------------------------- | ----------- | ------------- | ------ |
| Gitsigns next_hunk                 | \<leader>hj | gitsigns.nvim | normal |
| Gitsigns prev_hunk                 | \<leader>hk | gitsigns.nvim | normal |
| Gitsigns stage_hunk                | \<leader>hs | gitsigns.nvim | normal |
| Gitsigns reset_hunk                | \<leader>hr | gitsigns.nvim | normal |
| Gitsigns undo_stage_hunk           | \<leader>hu | gitsigns.nvim | normal |
| Gitsigns stage_buffer              | \<leader>hS | gitsigns.nvim | normal |
| Gitsigns reset_buffer              | \<leader>hR | gitsigns.nvim | normal |
| blame line                         | \<leader>hb | gitsigns.nvim | normal |
| Gitsigns diffthis == 比较当前文件  | \<leader>hd | gitsigns.nvim | normal |
| diffthis("~") == 比较当前行        | \<leader>hD | gitsigns.nvim | normal |
| Gitsigns toggle_current_line_blame | \<leader>tb | gitsigns.nvim | normal |
| Gitsigns toggle_deleted            | \<leader>td | gitsigns.nvim | normal |
| Gitsigns select_hunk               | ih          | gitsigns.nvim | o      |
| Gitsigns select_hunk               | ih          | gitsigns.nvim | x      |



#### whick key

which功能就是**整合命令 + 提示**。

进入 which-key，normal 模式下只按下 leader 键就会出现页面。

| mapping | command                           | 分类     | model  |
| ------- | --------------------------------- | -------- | ------ |
| a       | 进入欢迎页                        |          | normal |
| e       | 打开侧边栏                        |          | normal |
| r       | 打开最近文件                      |          | normal |
| p       | 最近项目                          |          | normal |
|         |                                   |          |        |
| go      | open changed file                 | Git      | normal |
| gb      | checkout branch                   | Git      | normal |
| gc      | checkout commit                   | Git      | normal |
| gC      | checkout commit(for current file) | Git      | normal |
|         |                                   |          |        |
| tf      | 以浮动弹窗方式打开终端            | Terminal | normal |
| th      | 以水平方式打开终端                | Terminal | normal |
| tv      | 以垂直方式打开终端                | Terminal | normal |



#### copilot.vim

| command                      | keybinding       | plugin      | model   |
| ---------------------------- | ---------------- | ----------- | ------- |
| Copilot 安装（:Copilot<CR>） | 其实只需执行一次 | copilot.vim | teminal |
| Copilot enable               | \<leader>ce      | copilot.vim | normal  |
| Copilot disable              | \<leader>cd      | copilot.vim | normal  |
| copilot-dismiss              | <C-]>            | copilot.vim | insert  |
| copilot-suggest              | <M-\\>           | copilot.vim | insert  |
| copilot-next                 | <M-]>            | copilot.vim | insert  |
| copilot-previous             | <M-[>            | copilot.vim | insert  |



