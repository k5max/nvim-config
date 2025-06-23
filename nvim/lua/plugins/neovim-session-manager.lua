return {
    "Shatur/neovim-session-manager",
    commit = "b552ee8667037be5d0291229279a35af25e515fb", -- neovim version < 0.10
    config = function ()
        local Path = require("plenary.path")
        local config = require("session_manager.config")
        require("session_manager").setup({
            sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
            session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
            dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
            autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autosave_last_session = true, -- Automatically save last session on exit and on session switch.
            autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
            autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                "gitcommit",
                "gitrebase",
            },
            autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
            autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
            max_path_length = 0,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
        })

        -- 会话加载后自动打开 NvimTree
        local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {}) -- A global group for all your config autocommands
        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "SessionLoadPost",
            group = config_group,
            callback = function()
                require("nvim-tree.api").tree.toggle(false, true)
            end,
        })

        local function show_prompt_message(message, duration)
            vim.api.nvim_echo({{message}}, false, {})
            vim.defer_fn(function()
                vim.cmd("echohl None | echomsg ''")
            end, duration)
        end

        -- key mapping
        -- vim.keymap.set("n", "<leader>sl", "<cmd>SessionManager load_session<cr>", { noremap = true, silent = true, desc = "SessionManager Load Session" })
        -- vim.keymap.set("n", "<leader>sL", "<cmd>SessionManager load_last_session<cr>", { noremap = true, silent = true, desc = "SessionManager Load Last Session" })
        -- vim.keymap.set("n", "<leader>ss", "<cmd>SessionManager save_current_session<cr>", { noremap = true, silent = true, desc = "SessionManager Save Current Session" })
        -- vim.keymap.set("n", "<leader>sd", "<cmd>SessionManager delete_current_dir_session<cr>", { noremap = true, silent = true, desc = "SessionManager Delete Current Dir Session" })
        -- vim.keymap.set("n", "<leader>sD", "<cmd>SessionManager delete_session<cr>", { noremap = true, silent = true, desc = "SessionManager Delete Session" })
        vim.keymap.set("n", "<leader>sl", function()
            vim.cmd("SessionManager load_session")
            show_prompt_message("Load Session", 2000)
        end, { noremap = true, silent = true, desc = "SessionManager Load Session" })
        vim.keymap.set("n", "<leader>sL", function()
            vim.cmd("SessionManager load_last_session")
            show_prompt_message("Load Last Session", 2000)
        end, { noremap = true, silent = true, desc = "SessionManager Load Last Session" })
        vim.keymap.set("n", "<leader>ss", function()
            vim.cmd("SessionManager save_current_session")
            show_prompt_message("Save Current Session", 2000)
        end, { noremap = true, silent = true, desc = "SessionManager Save Current Session" })
        vim.keymap.set("n", "<leader>sd", function()
            vim.cmd("SessionManager delete_current_dir_session")
            show_prompt_message("Delete Current Session", 2000)
        end, { noremap = true, silent = true, desc = "SessionManager Delete Current Dir Session" })
        vim.keymap.set("n", "<leader>sD", function()
            vim.cmd("SessionManager delete_session")
            show_prompt_message("Delete Session", 2000)
        end, { noremap = true, silent = true, desc = "SessionManager Delete Session" })
    end
}
