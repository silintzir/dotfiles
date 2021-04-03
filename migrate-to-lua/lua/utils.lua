local nvim_config_dir = vim.fn.getenv("HOME") .. "/.config/nvim/lua/"

--[[
-- vim.o: editor options - like :set
-- vim.bo: buffer-scoped local-options
-- vim.wo: window-scoped local-options
--]]
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local get_map_options = function(opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    return options
end

local M = {}

M.exec = function(command)
    vim.api.nvim_exec(command, false)
end

M.t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.config_file_exists = function(name)
    local f = io.open(nvim_config_dir .. name .. ".lua", "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

-- set global mapping
M.map = function(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, get_map_options(opts))
end

-- set a buffer-scoped mapping
M.buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, get_map_options(opts))
end

-- sets an option (global, buffer-scoped or window-scoped)
M.opt = function(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

-- returns os
M.get_os = function()
    return vim.api.nvim_eval([[substitute(system("uname"), "\n", "", "")]])
end

_G.inspect = function(...)
    print(vim.inspect(...))
end

M.inspect = _G.inspect

return M
