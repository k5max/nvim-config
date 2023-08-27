return {
    -- https://github.com/MattesGroeger/vim-bookmarks

    -- default shortcuts => see more: https://github.com/MattesGroeger/vim-bookmarks#Usage    
    -- | Action | Shortcut | Command |
    -- | --- | --- | --- |
    -- | Add/remove bookmark at current line | mm | :BookmarkToggle |
    -- | Add/edit/remove annotation at current line | mi | :BookmarkAnnotate <TEXT> |
    -- | Jump to next bookmark in buffer | mn | :BookmarkNext |
    -- | Jump to previous bookmark in buffer | mp | :BookmarkPrev |
    -- | Show all bookmarks (toggle) | ma | :BookmarkShowAll` |
    -- | Clear bookmarks in current buffer only | mc | :BookmarkClear |
    -- | Clear bookmarks in all buffers | mx | :BookmarkClearAll |

    "MattesGroeger/vim-bookmarks",
    event = "VeryLazy",
}
