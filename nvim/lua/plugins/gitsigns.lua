return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            -- 字母图标 A 增加，C修改，D 删除
            signs = {
                add          = { text = "A|" },
                change       = { text = "M|" },
                delete       = { text = "D_" },
                topdelete    = { text = "D‾" },
                changedelete = { text = "D~" },
                untracked    = { text = "┆" },
            },
            signs_staged = {
                add          = { text = "A|" },
                change       = { text = "M|" },
                delete       = { text = "D_" },
                topdelete    = { text = "D‾" },
                changedelete = { text = "D~" },
                untracked    = { text = "┆" },
            },
            signs_staged_enable = true,
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
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
                virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d %H:%M> - <summary>",
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
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"]c", bang = true})
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { noremap = true, silent = true, desc = "Gitsigns Next Hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"[c", bang = true})
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { noremap = true, silent = true, desc = "Gitsigns Prev Hunk" })

                map("n", "<leader>hj", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"]c", bang = true})
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { noremap = true, silent = true, desc = "Gitsigns Next Hunk" })

                map("n", "<leader>hk", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"[c", bang = true})
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { noremap = true, silent = true, desc = "Gitsigns Prev Hunk" })

                -- Actions
                map("n", "<leader>hs", gitsigns.stage_hunk, { noremap = true, silent = true, desc = "Gitsigns Stage Hunk" })
                map("n", "<leader>hr", gitsigns.reset_hunk, { noremap = true, silent = true, desc = "Gitsigns Reset Hunk" })
                map("n", "<leader>hu", gitsigns.undo_stage_hunk, { noremap = true, silent = true, desc = "Gitsigns Undo Stage Hunk" })
                map("n", "<leader>hp", gitsigns.preview_hunk, { noremap = true, silent = true, desc = "Gitsigns Preview Hunk" })
                map("v", "<leader>hs", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { noremap = true, silent = true, desc = "Gitsigns Stage Hunk(Visual)" })
                map("v", "<leader>hr", function() gitsigns.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { noremap = true, silent = true, desc = "Gitsigns Reset Hunk(Visual)" })
                map("v", "<leader>hu", function() gitsigns.undo_stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { noremap = true, silent = true, desc = "Gitsigns Undo Stage Hunk(Visual)" })
                map("n", "<leader>hS", gitsigns.stage_buffer, { noremap = true, silent = true, desc = "Gitsigns Stage Buffer" })
                map("n", "<leader>hR", gitsigns.reset_buffer, { noremap = true, silent = true, desc = "Gitsigns Reset Buffer" })
                map("n", "<leader>hb", function() gitsigns.blame_line{full=true} end, { noremap = true, silent = true, desc = "Gitsigns Blame Line" })
                map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { noremap = true, silent = true, desc = "Gitsigns Toggle Current Line Blame" })
                map("n", "<leader>td", gitsigns.toggle_deleted, { noremap = true, silent = true, desc = "Gitsigns Toggle Deleted" })
                -- recommend lazygit for diff
                map("n", "<leader>hd", gitsigns.diffthis, { noremap = true, silent = true, desc = "Gitsigns Diffthis" })
                map("n", "<leader>hD", function() gitsigns.diffthis("~") end, { noremap = true, silent = true, desc = "Gitsigns Diffthis~" })

                -- Text object
                map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true, desc = "Gitsigns Select Hunk" })
            end
        })
    end
}
