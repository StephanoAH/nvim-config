local npairs = require'nvim-autopairs'
vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]
vim.cmd [[set shortmess+=c]]

vim.o.completeopt = "menuone,noselect"

require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 40,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false;
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 1000,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = true,
        treesitter = true
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

_G.completion_handle_cr = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()['selected'] ~= -1 then
    return vim.fn['compe#confirm']('<CR>')
  end

  if vim.fn['vsnip#expandable']() ~= 0 then
    return npairs.esc('<Plug>(vsnip-expand)')
  end

  return npairs.check_break_line_char()
end

--  mappings 
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})         -- Tab completion in insert mode
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})     -- Shift Tab completion in insert mode
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.completion_handle_cr()', {
  expr = true,
  silent = true,
  noremap = false
})                                                                                   -- Enter for insert autocomplete
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {
  expr = true,
  silent = true,
})      
