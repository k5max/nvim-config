return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<leader>o", "<cmd>Outline<CR>", desc = "Outline: Toggle outline" },
        -- default keymaps (These mappings are active only for the outline window.)
        -- https://github.com/hedyhli/outline.nvim?tab=readme-ov-file#default-keymaps
    },
    opts = {
        outline_window = {
            width = 20,
        },
        symbols = {
            filter = {
                default = { 'String', exclude = true },
            }
        },
    },
}
