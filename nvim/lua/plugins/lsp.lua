-- This file configures some plugins related to LSP
return {
    {
        -- mason 和 mason-lspconfig 负责安装和管理 LSP 服务器
        "mason-org/mason.nvim",
        config = function()
            local mason = require("mason")
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
        -- mason.nvim 和 nvim-lspconfig 的桥梁
        "mason-org/mason-lspconfig.nvim",
        tag = "v1.32.0",
        config = function()
            local mason_config = require("mason-lspconfig")
            mason_config.setup({
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "lua_ls",
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
            -- clangd
            lspconfig.clangd.setup {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                cmd = {
                    "clangd",
                    "--background-index", -- 后台建立索引，并持久化到disk
                    "--clang-tidy",       -- 开启clang-tidy
                    -- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
                    "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
                    "--completion-style=detailed",
                    "--cross-file-rename=true",
                    "--header-insertion=iwyu",
                    "--pch-storage=memory",
                    -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
                    "--function-arg-placeholders=false",
                    "--log=verbose",
                    "--ranking-model=decision_forest",
                    -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
                    "--header-insertion-decorators",
                    "-j=12",
                    "--pretty",
                    "--offset-encoding=utf-16",
                },
            }
            -- pyright
            lspconfig.pyright.setup {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true
                        }
                    }
                }
            }
            -- lua_ls
            lspconfig.lua_ls.setup {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                    return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            }

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
                    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
                    -- typehierarchy require nvim >= 0.10.0
                    -- vim.keymap.set('n', 'gT', vim.lsp.buf.typehierarchy, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
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
