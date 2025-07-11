return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("t", "󰭷  Find text", ":Telescope live_grep<CR>"),
            dashboard.button("p", "󰉋  Find project", ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>"),
            dashboard.button("s", "󰦛  Load session", ":SessionManager load_session<CR>"),
            -- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        local function footer()
            -- NOTE: requires the fortune-mod package to work
            -- local handle = io.popen("fortune")
            -- local fortune = handle:read("*a")
            -- handle:close()
            -- return fortune
            return "Talk is cheap. Show me the code."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
        alpha.setup(dashboard.opts)
    end
}
