-- 默认使用 nvim-treesitter 的折叠，如果存在 lsp 则使用 lsp
-- 具体内容看这两个配置文件

-- Source: 
-- https://github.com/patricorgi/dotfiles/blob/main/.config/nvim/lua/custom/config/folding.lua
-- https://www.reddit.com/r/neovim/comments/1fzn1zt/custom_fold_text_function_with_treesitter_syntax/
local function fold_virt_text(result, start_text, lnum)
    local text = ''
    local hl
    for i = 1, #start_text do
        local char = start_text:sub(i, i)
        local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
        local outmost_highlight = captured_highlights[#captured_highlights]
        if outmost_highlight then
            local new_hl = '@' .. outmost_highlight.capture
            if new_hl ~= hl then
                -- as soon as new hl appears, push substring with current hl to table
                table.insert(result, { text, hl })
                text = ''
                hl = nil
            end
            text = text .. char
            hl = new_hl
        else
            text = text .. char
        end
    end
    table.insert(result, { text, hl })

end
function _G.custom_foldtext()
    local start_text = vim.fn.getline(vim.v.foldstart):gsub('\t', string.rep(' ', vim.o.tabstop))
    local nline = vim.v.foldend - vim.v.foldstart
    local result = {}
    fold_virt_text(result, start_text, vim.v.foldstart - 1)
    table.insert(result, { ' ... ↙ ' .. nline .. ' lines', 'Delimiter' })
    return result
end
vim.opt.foldlevel = 99 -- 默认不要折叠
vim.opt.foldtext = 'v:lua.custom_foldtext()'
