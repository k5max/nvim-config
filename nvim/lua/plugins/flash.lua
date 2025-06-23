return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            -- options used when flash is activated through
            -- `f`, `F`, `t`, `T`, `;` and `,` motions
            char = {
                enabled = true,
                -- show jump labels
                jump_labels = false
            }
        }
    },
    -- stylua: ignore
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash: Start" },
        { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash: Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Flash: Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash: Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash: Toggle Flash Search" },

        -- Jump to a line
        { "<leader>jl", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^"}) end, desc = "Flash: Jump Line" },
    },
}
