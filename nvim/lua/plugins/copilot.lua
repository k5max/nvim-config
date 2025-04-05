return {
    {
		"github/copilot.vim",
        enabled = false,
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

            vim.keymap.set('n', '<leader>ct', function()
                if vim.g.copilot_enabled then
                    vim.g.copilot_enabled = false
                    show_toggle_message("Disable copilot", 1000)
                else
                    vim.g.copilot_enabled = true
                    show_toggle_message("Enable copilot", 1000)
                end
            end, { noremap = true, silent = true, desc = "Copilot Toggle" })
			vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true, desc = "Copilot Enable" })
			vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true, desc = "Copilot Disable" })
			vim.keymap.set("n", "<leader>co", ":Copilot<CR>", { noremap = true, silent = true, desc = "Copilot Go" })
            vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", { noremap = true, silent = true, desc = "Copilot Dismiss" })
            vim.keymap.set("i", "<M-\\>", "<Plug>(copilot-suggest)", { noremap = true, silent = true, desc = "Copilot Suggest" })
			vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { noremap = true, silent = true, desc = "Copilot Next" })
			vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { noremap = true, silent = true, desc = "Copilot Previous" })
            -- 更多参考:help copilot
		end
	}
}
