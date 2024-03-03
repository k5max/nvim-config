local opts = {
    -- lsp 结合 cmp 自动补全
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

return {
    custom_on_setup = function(server)
        server.setup(opts)
    end,
}
