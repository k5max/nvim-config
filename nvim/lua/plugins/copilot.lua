return {
    {
		"github/copilot.vim",
		config = function()
			vim.g.copilot_enabled = true
			vim.g.copilot_no_tab_map = true
			-- vim.api.nvim_set_keymap('n', '<leader>go', ':Copilot<CR>', { silent = true })
			vim.api.nvim_set_keymap('n', '<leader>ce', ':Copilot enable<CR>', { silent = true })
			vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot disable<CR>', { silent = true })
            vim.api.nvim_set_keymap('i', '<C-]>', '<Plug>(copilot-dismiss)', { silent = true })
            vim.api.nvim_set_keymap('i', '<M-\\>', '<Plug>(copilot-suggest)', { silent = true })
			vim.api.nvim_set_keymap('i', '<M-]>', '<Plug>(copilot-next)', { silent = true })
			vim.api.nvim_set_keymap('i', '<M-[>', '<Plug>(copilot-previous)', { silent = true })
            -- 更多参考:help copilot
		end
	}
}
