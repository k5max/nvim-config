vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

-- Diagnostics UI
vim.diagnostic.config({
    virtual_text = true, -- 出错时在行尾显示错误信息
    underline = true,
    -- 在输入模式下也更新提示，设置为 true 也许会影响性能
    update_in_insert = false,
    float = {
        border = "rounded",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.WARN] = '󰀪',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌶',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
    },
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: Goto Declaration' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'LSP: Goto Definition' })
        -- select model 的gh使用的很少，因此这里将默认的K改成了gh
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: Goto Hover' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = event.buf, desc = 'LSP: Goto Implementation' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = event.buf, desc = 'LSP: Goto References' })

        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = event.buf })
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = event.buf })
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = event.buf })
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, { buffer = event.buf })

        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'LSP: Goto Type_definition' })
        vim.keymap.set('n', 'gT', vim.lsp.buf.typehierarchy, { buffer = event.buf, desc = 'LSP: Goto Typehierarchy' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP: Rename Symbol' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Code Action' })
        vim.keymap.set({ 'n', 'v' }, '<leader>lf', function() vim.lsp.buf.format { async = true } end, { buffer = event.buf, desc = 'LSP: Format Code' })

        -- [Common method]
        -- customize toggle status
        local function show_toggle_message(message, duration)
            vim.api.nvim_echo({{message}}, false, {})
            vim.defer_fn(function()
                vim.cmd('echohl None | echomsg ""')
            end, duration)
        end

        -- [Diagnostics]
        -- diagnostics keymapping 
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<leader>qt',function()
            local diagnostic_status = not vim.diagnostic.is_enabled()
            vim.diagnostic.enable(diagnostic_status)
            local status_text = 'Toggle Diagnostics: ' .. (diagnostic_status and "Enabled" or "Disabled")
            show_toggle_message(status_text, 1000)
        end, { noremap = true, silent = true, desc = "Diagnostic: Toggle" })

        vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Diagnostic: Open Float' })
        --'[d' and ']d' has becomed default
        -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Diagnostic Goto Prev" })
        -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Diagnostic Goto Next" })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = 'Diagnostic: Setloclist' })


        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- Inlay hint
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            -- vim.lsp.inlay_hint.enable() -- default enable
            vim.keymap.set('n', '<leader>qh', function()
                local inlay_hint_status = not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
                vim.lsp.inlay_hint.enable(inlay_hint_status)
                local status_text = 'Toggle Inlay Hint: ' .. (inlay_hint_status and "Enabled" or "Disabled")
                show_toggle_message(status_text, 1000)
            end, { buffer = event.buf, desc = 'LSP: Toggle Inlay Hints' })
        end

        -- Highlight words under cursorh
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) and vim.bo.filetype ~= 'bigfile' then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
        end

    end,
})
