return {
    {
        -- mason 负责安装和管理 LSP 服务器
        "mason-org/mason.nvim",
        config = function()
            local mason = require("mason")
            -- ~/.local/share/nvim/mason
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    -- nvim-lspconfig 已经迁移到 nvim.lsp.config
}
