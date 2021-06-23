vim.cmd("packadd packer.nvim")
-- this file can be loaded by calling `lua require('plugins') from the init.vim
return require("packer").startup(
    function()
        -- packer can manage itself
        use {"wbthomason/packer.nvim"}

        -- startup time
        use {"tweekmonster/startuptime.vim"}

        -- colorscheme
        -- use { 'npxbr/gruvbox.nvim', requires = { "rktjmp/lush.nvim" } }
        use {"morhetz/gruvbox"}

        -- web dev icons
        use {"kyazdani42/nvim-web-devicons"}

        -- status line
        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function()
                require("plugins.lualine")
            end
        }

        -- tabline
        use {"romgrk/barbar.nvim"}

        -- visual star search
        use {"bronson/vim-visual-star-search"}

        -- NerdTree
        -- use {"preservim/nerdtree"}

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins.telescope")
            end,
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }
        use {"nvim-telescope/telescope-fzy-native.nvim"}

        -- TreeSitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("plugins.treesitter")
            end
        }
        use {"nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter"}

        -- Coc.nvim
        use {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                require("plugins.coc")
            end
        }

        -- prisma
        use {
            "pantharshit00/vim-prisma"
        }

        -- git
        use {"tpope/vim-fugitive"}

        -- markdown
        use {"iamcco/markdown-preview.nvim"}

        -- snippets
        use {"SirVer/ultisnips"}
        use {"honza/vim-snippets"}

        -- editor
        use {"kkoomen/vim-doge"}
        use {"justinmk/vim-sneak"}
        use {
            "mhartington/formatter.nvim",
            config = function()
                require("plugins.formatter")
            end
        }
        use {"tpope/vim-commentary"}
        use {"tpope/vim-surround"}
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("plugins.autopairs")
            end
        }
        use {
            "editorconfig/editorconfig-vim",
            config = function()
                require("plugins.editorconfig")
            end
        }
    end
)
