return {
    {
		"github/copilot.vim",
		config = function()
            -- 默认是否开启
			vim.g.copilot_enabled = false
			vim.g.copilot_no_tab_map = true

            local function show_toggle_message(message, duration)
                vim.api.nvim_echo({{message}}, false, {})
                vim.defer_fn(function()
                    vim.cmd('echohl None | echomsg ""')
                end, duration)
            end

            local function toggle_copilot()
                if vim.g.copilot_enabled then
                    vim.g.copilot_enabled = false
                    show_toggle_message("Disable copilot", 1000)
                else
                    vim.g.copilot_enabled = true
                    show_toggle_message("Enable copilot", 1000)
                end
            end

            vim.keymap.set('n', '<leader>ct', toggle_copilot, { noremap = true, silent = true, desc = "Toggle copilot" })
			-- vim.api.nvim_set_keymap('n', '<leader>ce', ':Copilot enable<CR>', { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot disable<CR>', { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap('n', '<leader>go', ':Copilot<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('i', '<C-]>', '<Plug>(copilot-dismiss)', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('i', '<M-\\>', '<Plug>(copilot-suggest)', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('i', '<M-]>', '<Plug>(copilot-next)', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('i', '<M-[>', '<Plug>(copilot-previous)', { noremap = true, silent = true })
            -- 更多参考:help copilot
		end
	}
}
