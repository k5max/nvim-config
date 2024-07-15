# NeoVim 配置

## 目录结构

```
nvim
├── init.lua
├── lazy-lock.json
└── lua
    ├── autocmds.lua
    ├── basic.lua
    ├── clipborad.lua
    ├── keymappings.lua
    ├── lsp
    │   ├── clangd.lua
    │   ├── pyright.lua
    │   └── ...
    └── plugins
        ├── alpha.lua
        ├── argtextobj.lua
        ├── bufferline.lua
        ├── cmp.lua
        ├── colorscheme.lua
        ├── comment.lua
        ├── copilot.lua
        ├── flash.lua
        ├── gitsigns.lua
        ├── im-select.lua
        ├── indent-blankline.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── neovim-session-manager.lua
        ├── nvim-autopairs.lua
        ├── nvim-colorizer.lua
        ├── nvim-surround.lua
        ├── nvim-tree.lua
        ├── nvim-treesitter.lua
        ├── project.lua
        ├── rainbow-delimiters.lua
        ├── replacewithregister.lua
        ├── symbols-outline.lua
        ├── telescope.lua
        ├── toggleterm.lua
        ├── vim-bookmarks.lua
        └── vim-visual-multi.lua
```

init.lua -- init文件

autocmds.lua -- neovim 自动命令

basic.lua -- neovim 基本配置

clipborad.lua -- neovim 剪贴板设置

keymappings.lua -- neovim 基本快捷键配置

lsp -- lsp配置文件所在目录

plugins -- 插件文件配置所在目录



## 插件列表

### plugin manager

| plugin    | desc                                             | url                                |
| --------- | ------------------------------------------------ | ---------------------------------- |
| lazy.nvim | lazy.nvim is a modern plugin manager for Neovim. | https://github.com/folke/lazy.nvim |



### common

| plugin                  | desc                                                         | url                                                    |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------ |
| alpha-nvim              | alpha is a fast and fully programmable greeter for neovim.   | https://github.com/goolord/alpha-nvim                  |
| argtextobj.vim          | vim-scripts - argtextobj                                     | https://github.com/vim-scripts/argtextobj.vim          |
| bufferline.nvim         | A *snazzy* 💅 buffer line (with tabpage integration) for Neovim built using lua. | https://github.com/akinsho/bufferline.nvim             |
| Comment.nvim            | Smart and Powerful commenting plugin for neovim              | https://github.com/numToStr/Comment.nvim               |
| copilot.vim             | GitHub Copilot for Vim and Neovim                            | https://github.com/github/copilot.vim                  |
| flash.nvim              | flash.nvim lets you navigate your code with search labels, enhanced character motions, and Treesitter integration. | https://github.com/folke/flash.nvim                    |
| gitsigns.nvim           | Super fast git decorations implemented purely in Lua.        | https://github.com/lewis6991/gitsigns.nvim             |
| im-select.nvim          | Switch Input Method automatically depends on NeoVim's edit mode. | https://github.com/keaising/im-select.nvim             |
| indent-blankline.nvim   | This plugin adds indentation guides to all lines (including empty lines). | https://github.com/lukas-reineke/indent-blankline.nvim |
| lualine.nvim            | A blazing fast and easy to configure Neovim statusline written in Lua. | https://github.com/nvim-lualine/lualine.nvim           |
| nvim-autopairs          | A super powerful autopair plugin for Neovim that supports multiple characters. | https://github.com/windwp/nvim-autopairs               |
| nvim-colorizer.lua      | A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit. | https://github.com/NvChad/nvim-colorizer.lua           |
| nvim-surround           | Surround selections, stylishly                               | https://github.com/kylechui/nvim-surround              |
| nvim-tree.lua           | A File Explorer For Neovim Written In Lua                    | https://github.com/nvim-tree/nvim-tree.lua             |
| nvim-treesitter         | Treesitter configurations and abstraction layer for Neovim.  | https://github.com/nvim-treesitter/nvim-treesitter     |
| project.nvim            | project.nvim is an all in one neovim plugin written in lua that provides superior project management. | https://github.com/ahmedkhalf/project.nvim             |
| rainbow-delimiters.nvim | This Neovim plugin provides alternating syntax highlighting (“rainbow parentheses”) for Neovim, powered by Tree-sitter. | https://github.com/HiPhish/rainbow-delimiters.nvim     |
| ReplaceWithRegister     | vim-scripts - ReplaceWithRegister                            | https://github.com/vim-scripts/ReplaceWithRegister     |
| symbols-outline.nvim    | A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages. | https://github.com/simrat39/symbols-outline.nvim       |
| telescope.nvim          | telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from `neovim` core. | https://github.com/nvim-telescope/telescope.nvim       |
| toggleterm.nvim         | A *neovim* plugin to persist and toggle multiple terminals during an editing session | https://github.com/akinsho/toggleterm.nvim             |
| vim-bookmarks           | This vim plugin allows toggling bookmarks per line.          | https://github.com/MattesGroeger/vim-bookmarks         |
| vim-visual-multi        | It's called vim-visual-multi in analogy with *visual-block*, but the plugin works mostly from normal mode. | https://github.com/mg979/vim-visual-multi              |
| which-key.nvim          | WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing. | https://github.com/folke/which-key.nvim                |



### lsp + cmp

| plugin               | desc                                                         | url                                                  |
| -------------------- | ------------------------------------------------------------ | ---------------------------------------------------- |
| nvim-lspconfig       | Configs for the Nvim LSP client                              | https://github.com/neovim/nvim-lspconfig             |
| mason.nvim           | Portable package manager for Neovim that runs everywhere Neovim runs.Easily install and manage LSP servers, DAP servers, linters, and formatters. | https://github.com/williamboman/mason.nvim           |
| mason-lspconfig.nvim | mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together. | https://github.com/williamboman/mason-lspconfig.nvim |
| nvim-cmp             | A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced". | https://github.com/hrsh7th/nvim-cmp                  |



## 快捷键

在以下快捷键中，`<leader>` 代表 ` ` 字符。

### 自定义

| command                      | keymapping   | origin                   | model  |
| ---------------------------- | ------------ | ------------------------ | ------ |
| 垂直分屏                     | `<leader>sv` | `<C-w>v`                 | normal |
| 水平分屏                     | `<leader>sh` | `<C-w>s`                 | normal |
| 关闭当前窗口                 | `<leader>sc` | `<C-w>c`                 | normal |
| 关标跳到左边窗口             | `<C-h>`      | `<C-w>h`                 | normal |
| 关标跳到下边窗口             | `<C-j>`      | `<C-w>j`                 | normal |
| 关标跳到上边窗口             | `<C-k>`      | `<C-w>k`                 | normal |
| 关标跳到右边窗口             | `<C-l>`      | `<C-w>l`                 | normal |
| 跳到最顶部窗口               | `<C-t>`      | `<C-w>t`                 | normal |
| 减小5行宽度                  | `<leader>h`  | `<C-w>5<`                | normal |
| 增加5行宽度                  | `<leader>l`  | `<C-w>5>`                | normal |
| 减小5行高度                  | `<leader>j`  | `<C-w>5-`                | normal |
| 增加5行高度                  | `<leader>k`  | `<C-w>5+`                | normal |
| 调换分屏位置（up and down）  | `sh`         | `<C-w>t<C-w>K`           | normal |
| 调换分屏位置（side by side） | `sv`         | `<C-w>t<C-w>H`           | normal |
| 取消搜索高亮                 | `<leader>nh` | `:nohl\<CR>`             | normal |
| 缩进代码                     | `>`          | `<gv`                    | visual |
| 反缩进代码                   | `<`          | `<gv`                    | visual |
| 下移文本                     | `<A-j>`      | `:move .+1<CR>`          | normal |
| 上移文本                     | `<A-k>`      | `:move .-2<CR>`          | normal |
| 下移文本                     | `<A-j>`      | `<Esc>:move .+1<CR>==gi` | insert |
| 上移文本                     | `<A-k>`      | `<Esc>:move .-2<CR>==gi` | insert |
| 下移选中的文本               | `<A-j>`      | `:move >+1\<CR>gv-gv`    | visual |
| 上移选中的文本               | `<A-k>`      | `:move <-2\<CR>gv-gv`    | visual |



### 插件快捷键

此处列出了我经常使用的一些快捷键。更多关于插件的快捷键设置请浏览对应的官方 Repository 



#### alpha-nvim

| command    | keybinding  | model  |
| ---------- | ----------- | ------ |
| 打开欢迎页 | `<leader>a` | normal |

#### bufferline.nvim

| command                        | keybinding   | model  |
| ------------------------------ | ------------ | ------ |
| 用telescope查找buffer          | `<leader>bf` | normal |
| 关闭buffer                     | `<leader>bc` | normal |
| BufferLinePickClose            | `<leader>bC` | normal |
| BufferLineCloseOthers          | `<leader>bo` | normal |
| BufferLinePick                 | `<leader>bg` | normal |
| BufferLineCyclePrev            | `<leader>bk` | normal |
| BufferLineCycleNext            | `<leader>bj` | normal |
| BufferLineMovePrev             | `<leader>bK` | normal |
| BufferLineMoveNext             | `<leader>bJ` | normal |
| BufferLineCloseRight           | `<leader>bl` | normal |
| BufferLineCloseLeft            | `<leader>bh` | normal |
| BufferLineTogglePin            | `<leader>bp` | normal |
| BufferLineGroupClose ungrouped | `<leader>bP` | normal |

#### cmp

| command                              | keybinding | model  |
| ------------------------------------ | ---------- | ------ |
| 选中下一个补全提示信息               | `<C-j>`    | insert |
| 选中上一个补全提示信息               | `<C-k>`    | insert |
| 向前翻4个补全提示信息                | `<C-u>`    | insert |
| 向后翻4个补全提示信息                | `<C-d>`    | insert |
| 退出补全（esc也可退出）              | `<C-e>`    | insert |
| ~~选中下一个补全提示信息（未使用）~~ | `<Tab>`    | insert |
| 选中上一个补全提示信息               | `<S-Tab>`  | insert |
| 选中当前补全提示                     | `<CR>`     | insert |

#### Comment.nvim

| command  | keybinding | model         |
| -------- | ---------- | ------------- |
| 注释单行 | `gcc`      | normal,visual |
| 注释多行 | `gc`       | normal,visual |

#### copilot.vim

| command                      | keybinding   | model   |
| ---------------------------- | ------------ | ------- |
| Copilot 安装（:Copilot<CR>） | `<leader>co` | teminal |
| Copilot toggle               | `<leader>ct` | normal  |
| Copilot enable               | `<leader>ce` | normal  |
| Copilot disable              | `<leader>cd` | normal  |
| copilot-dismiss              | `<C-]>`      | insert  |
| copilot-suggest              | `<M-\>`      | insert  |
| copilot-next                 | `<M-]>`      | insert  |
| copilot-previous             | `<M-[>`      | insert  |

#### flash.nvim

自行查看

#### gitsigns

| command                            | keybinding   | model          |
| ---------------------------------- | ------------ | -------------- |
| Gitsigns next_hunk                 | `]c`         | normal         |
| Gitsigns next_hunk                 | `[c`         | normal         |
| Gitsigns next_hunk                 | `<leader>hj` | normal         |
| Gitsigns prev_hunk                 | `<leader>hk` | normal         |
| Gitsigns stage_hunk                | `<leader>hs` | normal、visual |
| Gitsigns reset_hunk                | `<leader>hr` | normal、visual |
| Gitsigns undo_stage_hunk           | `<leader>hu` | normal、visual |
| Gitsigns preview_hunk              | `<leader>hp` | normal         |
| Gitsigns stage_buffer              | `<leader>hS` | normal         |
| Gitsigns reset_buffer              | `<leader>hR` | normal         |
| blame line                         | `<leader>hb` | normal         |
| Gitsigns toggle_current_line_blame | `<leader>tb` | normal         |
| Gitsigns diffthis                  | `<leader>hd` | normal         |
| Gitsigns diffthis("~")             | `<leader>hD` | normal         |
| Gitsigns toggle_deleted            | `<leader>td` | normal         |
| Gitsigns select_hunk               | `ih`         | o、x           |

#### lsp

这些都需要先安装 lsp 服务器

| command                             | keybinding   | model          |
| ----------------------------------- | ------------ | -------------- |
| vim.lsp.buf.declaration             | `gD`         | normal         |
| vim.lsp.buf.definition              | `gd`         | normal         |
| vim.lsp.buf.hover                   | `gh`         | normal         |
| vim.lsp.buffer.implementation       | `gi`         | normal         |
| vim.lsp.buf.references              | `gr`         | normal         |
| vim.lsp.buf.type_definition         | `<leader>D`  | normal         |
| vim.lsp.buf.rename                  | `<leader>rn` | normal         |
| vim.lsp.buf.code_action             | `<leader>ca` | normal、visual |
| vim.lsp.buf.format { async = true } | `<leader>f`  | normal         |
| diagnostic toggle                   | `<leader>qt` | normal         |
| diagnostic disable                  | `<leader>qd` | normal         |
| diagnostic enable                   | `<leader>qe` | normal         |
| diagnostic open_float               | `<leader>i`  | normal         |
| 跳到上一个错误                      | `[d`         | normal         |
| 跳到下一个错误                      | `]d`         | normal         |
| 打开/关闭诊断错误列表               | `<leader>q`  | normal         |

#### nvim-surround

自行了解

#### nvim-tree

| command                     | keybinding  | model  |
| --------------------------- | ----------- | ------ |
| 打开/关闭File Explorer      | `<leader>e` | normal |
| File Explorer中定位当前文件 | `<leader>m` | normal |
| 创建文件                    | `a`         | normal |
| 删除文件                    | `d`         | normal |
| 重命名文件                  | `r`         | normal |
| 复制文件                    | `c`         | normal |
| 粘贴文件                    | `p`         | normal |
| 剪切文件                    | `x`         | normal |

#### ReplaceWithRegister

| command                     | keybinding   | model  |
| --------------------------- | ------------ | ------ |
| ReplaceWithRegisterOperator | `<leader>r`  | normal |
| ReplaceWithRegisterLine     | `<leader>rr` | normal |
| ReplaceWithRegisterVisual   | `<leader>r`  | visual |

#### symbols-outline

| command       | keybinding  | model  |
| ------------- | ----------- | ------ |
| 打开/关闭大纲 | `<leader>o` | normal |

#### telescope

| command                                                      | keybinding   | model  |
| ------------------------------------------------------------ | ------------ | ------ |
| telescope弹窗内左移光标                                      | `<C-h>`      | insert |
| telescope弹窗内下移光标                                      | `<C-j>`      | insert |
| telescope弹窗内上移光标                                      | `<C-k>`      | insert |
| telescope弹窗内右移光标                                      | `<C-l>`      | insert |
| telescope弹窗内容向上滚动                                    | `<C-u>`      | insert |
| telescope弹窗内容向下滚动                                    | `<C-d>`      | insert |
| telescope关闭弹窗                                            | `<esc>`      | insert |
| Falling back to find_files if git_files can't find a .git directory | `<leader>ff` | normal |
| live grep                                                    | `<leader>fg` | normal |
| recent files                                                 | `<leader>fo` | normal |
| buffers                                                      | `<leader>fb` | normal |
| current_buffer_fuzzy_find                                    | `<leader>fB` | normal |
| jumplist                                                     | `<leader>fj` | normal |
| search_hitory                                                | `<leader>fl` | normal |
| command_hitory                                               | `<leader>fL` | normal |
| extentions.vim_bookmarks.current_file                        | `<leader>fm` | normal |
| extentions.vim_bookmarks.all                                 | `<leader>fM` | normal |
| registers                                                    | `<leader>fr` | normal |
| quickfix                                                     | `<leader>fq` | normal |
| lsp_document_symbols                                         | `<leader>fs` | normal |
| lsp_dynamic_workspace_symbols                                | `<leader>fS` | normal |
| :Telescope projects                                          | `<leader>fp` | normal |
| :Telescope diagnostics bufnr=0                               | `<leader>fd` | normal |
| :Telescope diagnostics                                       | `<leader>fD` | normal |
| keymaps                                                      | `<leader>fk` | normal |
| commands                                                     | `<leader>fc` | normal |
| autocommands                                                 | `<leader>fa` | normal |
| help_tags                                                    | `<leader>fh` | normal |
| man_pages                                                    | `<leader>fH` | normal |
| git_commits                                                  | `<leader>gc` | normal |
| git_bcommits                                                 | `<leader>gC` | normal |
| git_branchs                                                  | `<leader>gb` | normal |
| git_status                                                   | `<leader>gs` | normal |

#### toggleterm

| command                                 | keybinding   | model    |
| --------------------------------------- | ------------ | -------- |
| 打开toggleterm终端                      | `<C-\>`      | normal   |
| 光标跳到左边终端中                      | `<C-h>`      | terminal |
| 光标跳到下边终端中                      | `<C-j>`      | terminal |
| 光标跳到上边终端中                      | `<C-k>`      | terminal |
| 光标跳到右边终端中                      | `<C-l>`      | terminal |
| 终端进入normal模式                      | `<esc>`      | terminal |
| 打开Lazygit                             | `<leader>gg` | normal   |
| 打开NCDU                                | `<leader>tu` | normal   |
| 打开htop                                | `<leader>tt` | normal   |
| ToggleTerm direction=float              | `<leader>tf` | normal   |
| ToggleTerm direction=horizontal size=10 | `<leader>th` | normal   |
| ToggleTerm direction=vertical size=80   | `<leader>tv` | normal   |

#### vim-bookmarks

| command                           | keybinding | model  |
| --------------------------------- | ---------- | ------ |
| 在当前行添加/删除书签             | `mm`       | normal |
| 在当前行添加/编辑/删除 annotation | `mi`       | normal |
| 跳转到缓冲区中的下一个书签        | `mn`       | normal |
| 跳转到缓冲区中的上一个书签        | `mp`       | normal |
| 显示所有书签（单独窗口）          | `ma`       | normal |
| 仅清除当前缓冲区中的书签          | `mc`       | normal |
| 清除所有缓冲区中的书签            | `mx`       | normal |

#### vim-visual-multi

自行了解
