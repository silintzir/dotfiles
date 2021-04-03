local utils = require("utils")
_G.CocShowDocumentation = function()
    vim.fn["tools#show_documentation"]()
end
_G.CocCheckBackSpace = function()
    vim.fn["tools#check_back_space"]()
end
_G.CocRefresh = function()
    vim.fn["coc#refresh"]()
end

_G.CocSmartTab = function()
    if vim.fn.pumvisible() == 1 then
        return utils.t("<C-n>")
    else
        if CocCheckBackSpace() then
            return utils.t("<Tab>")
        else
            return CocRefresh()
        end
    end
end

_G.CocSmartShiftTab = function()
    return vim.fn.pumvisible() == 1 and utils.t "<C-p>" or utils.t "<C-h>"
end

local common_opts = {silent = true, noremap = true, expr = true}
-- utils.map("n", "K", "v:lua.CocShowDocumentation()", common_opts)
-- utils.map("i", "<Tab>", "v:lua.CocSmartTab()", common_opts)
-- utils.map("i", "<S-Tab>", "v:lua.CocSmartShiftTab()", common_opts)
-- utils.map("i", "<C-@>", "v:lua.CocRefresh()", common_opts)
