-- Load nvim config
require("pluginsList.lua")
require("mappings.lua")
local u = require("utils.lua")

-- Load plugins config
require("nvimTree.lua")
require("bufferline.lua")
require("statusline.lua")
require("telescope-nvim.lua")
require("treesitter.lua")
require("gitsigns.lua")
require("web-devicons.lua")
require("kommentary.lua")
require("todo-comments.lua")

-- lsp
require("nvim-lspconfig.lua")
require("nvim-compe.lua")

local cmd = vim.cmd
local g = vim.g

--cmd "colorscheme base16-onedark"
cmd "colorscheme tokyonight"
g.tokyonight_style = "night"

cmd "syntax enable"
cmd "syntax on"

g.indentLine_enabled = 1
g.indentLine_char_list = {'▏'}
g.mapleader = " "

-- Set javascript files to javascriptreact for jsx support
u.create_augroup({
  { "FileType", "javascript", "set", "ft=javascriptreact"}
}, "filetype_jsx")

u.create_augroup({
  { "BufWritePre", "*", "undojoin", "|", "Neoformat"}
}, "format_on_save")

g.closetag_filetypes = "html, jsx, js"

-- highlights
cmd("hi LineNr guibg=NONE")
cmd("hi SignColumn guibg=NONE")
cmd("hi VertSplit guibg=NONE")
cmd("highlight DiffAdd guifg=#81A1C1 guibg = none")
cmd("highlight DiffChange guifg =#3A3E44 guibg = none")
cmd("highlight DiffModified guifg = #81A1C1 guibg = none")
cmd("hi EndOfBuffer guifg=#282c34")

cmd("highlight TelescopeBorder   guifg=#3e4451")
cmd("highlight TelescopePromptBorder   guifg=#3e4451")
cmd("highlight TelescopeResultsBorder  guifg=#3e4451")
cmd("highlight TelescopePreviewBorder  guifg=#525865")
cmd("highlight PmenuSel  guibg=#98c379")

-- tree folder name , icon color
cmd("highlight NvimTreeFolderIcon guifg = #61afef")
cmd("highlight NvimTreeFolderName guifg = #61afef")

-- Init plugins
require("nvim-autopairs").setup()
require("colorizer").setup()

require("lspkind").init(
    {
        File = " "
    }
)

