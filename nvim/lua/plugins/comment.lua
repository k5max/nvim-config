return {
    -- comment => 注释
    "numToStr/Comment.nvim",
    config = function()
        local comment = require("Comment")
        comment.setup()
    end
}

