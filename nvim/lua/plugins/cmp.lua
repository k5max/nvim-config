-- This file configures some plugins related to CMP
return {
    -- Neovim 本身不支持代码补全，需要通过插件实现
    -- cmp 补全引擎
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- 补全源
        "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
        "hrsh7th/cmp-buffer", -- { name = 'buffer' },
        "hrsh7th/cmp-path", -- { name = 'path' }
        "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
        "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }

        -- 还可以配置一些扩展的snippet 比如vsnip luasnip utilsnip snippy
        -- For vsnip users
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",

        -- For luasnip users
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        -- Define icons on your own
        local kind_icons = {
            Text = "󰉿",
            Method = "󰊕",
            Function = "󰊕",
            Constructor = "",
            Field = "",
            Variable = "󰫧",
            Class = "𝓒",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "󰑭",
            Value = "󰀫",
            Enum = "ℰ",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        }
        -- find more here: https://www.nerdfonts.com/cheat-sheet

        cmp.setup({
            completion = {
                keyword_length=3,
            },
            -- 扩展的 snippet 引擎
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            -- 指定补全源
            sources = cmp.config.sources({
                { name = 'nvim_lsp' }, -- Neovim 内置的 LSP 提供的补全内容，必填
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' }
            }),
            -- 自定义显示
            formatting = {
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            experimental = {
                -- 虚拟文本显示
                ghost_text = false
            },
            -- 快捷键
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                -- scroll_docs only support cmp's documentation window.
                -- If the window content is too long, you can scroll.
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                --['<C-Space>'] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(), -- 取消补全，esc也可退出
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- they way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    -- 与 copilot tab 补全冲突，禁用
                    -- elseif has_words_before() then
                    --     cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, { { name = 'buffer' } })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, { { name = 'cmdline' } })
        })
    end
}
