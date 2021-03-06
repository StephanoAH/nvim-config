require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "+", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "-", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        noremap = true,
        buffer = true,
        ["n <leader><Down>"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n <leader><Up>"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>gb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}
