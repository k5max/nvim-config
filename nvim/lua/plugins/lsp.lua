-- This file configures some plugins related to LSP
return {
    {
        -- installer
        "williamboman/mason.nvim",
        config = function()
            -- mason 和 mason-lspconfig 负责安装和管理 LSP 服务器
            local mason = require("mason")
            -- :h mason-default-settings
            -- ~/.local/share/nvim/mason
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    {
        -- mason.nvim和neovim官方lspconfig的桥梁
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_config = require("mason-lspconfig")
            -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
            -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
            mason_config.setup({
                ensure_installed = {
                    -- "ccls", mason暂不支持
                    "clangd",
                    -- "cmake",
                    "pyright",
                    -- "jdtls",
                    -- "lua_ls",
                    -- "html",
                    -- "cssls",
                    -- "tsserver",
                },
                -- 是否应该自动安装
                automatic_installation = true,
            })
        end
    },
    {
        -- lspconfig
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- language server 安装列表
            -- { key: 服务器名， value: 配置文件 }
            -- key 必须为下列网址列出的 server name，不可以随便写
            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            local servers = {
                -- ccls = require("lsp.ccls"),
                clangd = require("lsp.clangd"),
                -- cmake = require("lsp.cmake"),
                pyright = require("lsp.pyright"),
                -- jdtls = require("lsp.jdtls"),
                -- lua_ls = require("lsp.lua"),
                -- html = require("lsp.html"),
                -- cssls = require("lsp.css"),
                -- tsserver = require("lsp.tsserver"),
            }

            -- 开启上面指定语言的lsp设置
            for name, config in pairs(servers) do
                if config ~= nil and type(config) == "table" then
                    -- 每个language server 初始化方法并不完全相同，用同一套初始化流程并不能满足不同语言定制的需要，
                    -- 这里将初始化方法抽离出来，让每个语言的配置文件来负责初始化，这里来负责调用。
                    -- 本质上就是封装了一层 custom_on_setup 方法
                    config.custom_on_setup(lspconfig[name])
                else
                    -- 如果没有自定义启动方法，就使用lspconfig默认启动方法，传入默认空参
                    lspconfig[name].setup({})
                end
            end

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)  -- select model 的gh使用的很少，因此这里将默认的K改成了gh
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wl', function()
                    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
                end,
            })

            -- diagnostics setting
            vim.diagnostic.config({
                virtual_text = true, -- 出错时在行尾显示错误信息
                signs = true, -- sign 图标信息
                underline = true,
                -- 在输入模式下也更新提示，设置为 true 也许会影响性能
                update_in_insert = false,
            })

            local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local function show_toggle_message(message, duration)
                vim.api.nvim_echo({{message}}, false, {})
                vim.defer_fn(function()
                    vim.cmd('echohl None | echomsg ""')
                end, duration)
            end

            -- diagnostics keymapping 
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions

            -- customize toggle diagnostics status
            vim.keymap.set('n', '<leader>qt', function()
                if vim.diagnostic.is_disabled() then
                    vim.diagnostic.enable()
                    -- vim.api.nvim_echo({ { "Enable diagnostics" } }, false, {})
                    show_toggle_message("Enable diagnostics", 1000)
                else
                    vim.diagnostic.disable()
                    -- vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
                    show_toggle_message("Disable diagnostics", 1000)
                end
            end, { noremap = true, silent = true, desc = "Diagnostic toggle" })
            vim.keymap.set('n', '<leader>qd', vim.diagnostic.disable, { noremap = true, silent = true, desc = "Diagnostic Disable" })
            vim.keymap.set('n', '<leader>qe', vim.diagnostic.enable, { noremap = true, silent = true, desc = "Diagnostic Enable" })
            vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Diagnostic Open Float" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Diagnostic Goto Prev" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Diagnostic Goto Next" })
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Diagnostic Setloclist" })
        end
    }
}
