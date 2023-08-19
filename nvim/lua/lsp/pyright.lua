local opts = {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}
return {
    custom_on_setup = function(server)
        server.setup(opts)
    end,
}
