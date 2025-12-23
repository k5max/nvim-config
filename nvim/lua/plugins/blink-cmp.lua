return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
    event = { "BufReadPost", "BufNewFile" },
	opts = {
		enabled = function()
			return not vim.tbl_contains({
				-- "lua",
				"markdown",
			}, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },
            ['<C-y>'] = { 'select_and_accept', 'fallback' },

			["<CR>"] = { "accept", "fallback" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

            -- ["<C-p>"] = { "show_signature", "hide_signature", "fallback" },
		},
		completion = {
			keyword = { range = "full" },
			list = { selection = { preselect = true, auto_insert = false } },
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
        signature = {
            enabled = true,
        },
        cmdline = {
			keymap = {
			    preset = "none",
                ['<C-e>'] = { 'cancel', 'fallback' },
                ['<C-y>'] = { 'select_and_accept', 'fallback' },
				["<CR>"] = { "select_and_accept", "fallback" },

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
			},
			completion = {
				list = { selection = { preselect = true, auto_insert = true } },
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
						-- enable for inputs as well, with:
						-- or vim.fn.getcmdtype() == "@"
					end,
				},
				ghost_text = { enabled = false },
			},
		},
		sources = {
			default = {
				"buffer",
				"lsp",
				"path",
				"snippets",
			},
			providers = {
				-- score_offset设置优先级数字越大优先级越高
				buffer = { score_offset = 4 },
				lsp = { score_offset = 3 },
				path = { score_offset = 2 },
				snippets = { score_offset = 10 },
				cmdline = {
					min_keyword_length = function(ctx)
						-- when typing a command, only show when the keyword is 3 characters or longer
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
							return 3
						end
						return 0
					end,
				},
			},
		},
        fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
