return {
    -- gitsigns => 左侧git提示    
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            -- 字母图标 A 增加，C修改，D 删除
            signs = {
                add = { hl = "GitSignsAdd", text = "A|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                change = { hl = "GitSignsChange", text = "M|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                delete = { hl = "GitSignsDelete", text = "D_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                topdelete = { hl = "GitSignsDelete", text = "D‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                changedelete = { hl = "GitSignsChange", text = "D~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
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
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            -- current_line_blame_formatter_opts = { relative_time = false},
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
            yadm = {
                enable = false,
            },
            -- keymapping
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', '<leader>hj', gs.next_hunk)
                map('n', '<leader>hk', gs.prev_hunk)

                -- Actions 
                map('n', '<leader>hs', gs.stage_hunk)
                map('n', '<leader>hu', gs.undo_stage_hunk)
                map('n', '<leader>hr', gs.reset_hunk)
                map('n', '<leader>hS', gs.stage_buffer)
                map('n', '<leader>hR', gs.reset_buffer)
                map('n', '<leader>hb', function() gs.blame_line{full=true} end)
                map('n', '<leader>hd', gs.diffthis)
                map('n', '<leader>hD', function() gs.diffthis("~") end)
                map('n', '<leader>tb', gs.toggle_current_line_blame)
                map('n', '<leader>td', gs.toggle_deleted)

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        })
    end
}
