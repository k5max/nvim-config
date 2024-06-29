return {
    -- gitsigns => 左侧git提示    
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            -- 字母图标 A 增加，C修改，D 删除
            signs = {
                add          = { text = 'A|' },
                change       = { text = 'M|' },
                delete       = { text = 'D_' },
                topdelete    = { text = 'D‾' },
                changedelete = { text = 'D~' },
                untracked    = { text = '┆' },
            },
            -- 显示图标
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            -- 行数高亮
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            -- current_line_blame_formatter_opts = { relative_time = false},
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d %H:%M> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            -- keymapping
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({']c', bang = true})
                else
                    gitsigns.nav_hunk('next')
                end
                end)

                map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({'[c', bang = true})
                else
                    gitsigns.nav_hunk('prev')
                end
                end)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('n', '<leader>hS', gitsigns.stage_buffer)
                map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                map('n', '<leader>hR', gitsigns.reset_buffer)
                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>hd', gitsigns.diffthis)
                map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                map('n', '<leader>td', gitsigns.toggle_deleted)

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        })
    end
}
