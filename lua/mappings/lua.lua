local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- keybind list
map("", "<leader>c", '"+y')

-- open terminals  
map("n", "<C-y>" , [[<Cmd> vnew term://zsh<CR>]] , opt) -- split term vertically , over the right  
map("n", "<C-x>" , [[<Cmd> split term://zsh | resize 10 <CR>]] , opt) -- split term vertically , over the right  
--map("i", "<C-y>", 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-y>"', opt)

-- Clear highlights
map("n", "<C-l>", "<cmd>noh<CR>")
