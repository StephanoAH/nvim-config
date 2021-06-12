-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}                      -- Package manager
        use {"kyazdani42/nvim-web-devicons"}                            -- Icons
        use {"kyazdani42/nvim-tree.lua"}                                -- File sidebar
        use {"nvim-lua/plenary.nvim"}                                   -- Lua function NECESSARY for telescope-media-files.nvim
        use {"lewis6991/gitsigns.nvim"}                                 -- Git signs before col number
        use {"glepnir/galaxyline.nvim"}                                 -- Status line
        use {"akinsho/nvim-bufferline.lua"}                             -- Top bufferline
        use {"nvim-treesitter/nvim-treesitter"}                         -- Nvim parser
        use {"p00f/nvim-ts-rainbow"}                                    -- Rainbow parentheses
        use {"chriskempson/base16-vim"}                                 -- Colorscheme base16-vim
        use {"folke/tokyonight.nvim"}                                   -- Colorscheme tokyonight
        use {"norcalli/nvim-colorizer.lua"}                             -- Color highlighter
        --use {"RRethy/vim-illuminate"}                                 --TODO Highligh other uses of the current word under the cursor
        use {"yamatsum/nvim-cursorline"}                                -- Highligh other uses of the current word under the cursor
        use {"Yggdroot/indentLine"}                                     -- Indentation
        use {"sbdchd/neoformat"}                                        -- Formatting code
        use {"neovim/nvim-lspconfig"}                                   -- LSP config
        use {"kabouzeid/nvim-lspinstall"}                               -- LSP install pulled directly from the latest VSCode release
        use {"hrsh7th/nvim-compe"}                                      -- Completion
        use {"mattn/emmet-vim"}                                         -- Emmet
        use {"windwp/nvim-autopairs"}                                   -- Auto pairs 
        use {"alvan/vim-closetag"}                                      -- Close html tags
        use {"onsails/lspkind-nvim"}                                    -- Pictograms for lsp completion items
        use {"nvim-telescope/telescope.nvim"}                           -- Fuzzy finder
        use {"nvim-telescope/telescope-media-files.nvim"}               -- FzF image extension
        use {"nvim-lua/popup.nvim"}                                     -- PopUp windows NECESSARY for telescope-media-files.nvim
        use {"b3nj5m1n/kommentary"}                                     -- Commenting plugin
        use {"folke/todo-comments.nvim"}
        use {"diepm/vim-rest-console"}                                  -- REST client
        use {"hrsh7th/vim-vsnip"}                                       --╮ Snippets
        use {"hrsh7th/vim-vsnip-integ"}                                 --| Vsnip integration
        use {"dsznajder/vscode-es7-javascript-react-snippets"}          --| Es-23 react snippets
        use {"xabikos/vscode-javascript"}                               --| vscode-javascript snippets
    end
)
