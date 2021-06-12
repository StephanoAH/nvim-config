-- o: Global b: Buffer w: Window
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt("o", "hidden", true)              -- Enable modified buffers in background
opt("o", "ignorecase", true)          
opt("o", "splitbelow", true)          -- Put new windows below current
opt("o", "splitright", true)          -- Put new windows right of current
opt("o", "termguicolors", true)       -- True color support
opt("w", "number", true)              -- Print line number
opt("o", "numberwidth", 2)            --
opt("o", "confirm", true)             -- Show a messages if buffer have unsaved changes

opt("o", "mouse", "a")                -- Mouse activate in all state

opt("w", "signcolumn", "yes")         --
opt("o", "cmdheight", 1)              

opt("o", "updatetime", 250) -- update interval for gitsigns 
opt("o", "clipboard", "unnamedplus")

-- for indenline
local indent = 2
opt("b", "expandtab", true )          -- Use spaces instead of tabs
opt("b", "shiftwidth", indent )       -- Size of an indent
opt("b", "smartindent", true )        -- Insert indents automatically
opt("b", "tabstop", indent )          -- Number of spaces tabs count for

local M = {}
local cmd = vim.cmd

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

return M
