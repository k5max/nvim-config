return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("todo-comments").setup({
        })

        -- Keymapping
        vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
        vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

        vim.keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", { noremap = true, silent = true, desc = "Telescope: Todo-Comments"})

        -- -- You can also specify a list of valid jump keywords
        -- vim.keymap.set("n", "]t", function()
        --     require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
        -- end, { desc = "Next error/warning todo comment" })
    end
}
