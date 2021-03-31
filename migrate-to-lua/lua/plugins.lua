-- this file can be loaded by calling `lua require('plugins') from the init.vim
return require("packer").startup(
  function()
    -- packer can manage itself
    use "wbthomason/packer.nvim"

    -- colorscheme
    -- use { 'npxbr/gruvbox.nvim', requires = { "rktjmp/lush.nvim" } }
    use {"morhetz/gruvbox"}

    -- web dev icons
    use {"kyazdani42/nvim-web-devicons"}

    -- Telescope
    use {"nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    -- NerdTree
    use {"preservim/nerdtree"}

    -- TreeSitter
    use {"nvim-treesitter/nvim-treesitter"}

    -- Lua
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-lua/popup.nvim"}
    use {"neovim/nvim-lspconfig"}
    use {"nvim-lua/completion-nvim"}
    use {"kabouzeid/nvim-lspinstall"}

    -- git
    use {"tpope/vim-fugitive"}

    -- editor
    use {"mhartington/formatter.nvim"}
    use {"tpope/vim-commentary"}
    use {"tpope/vim-surround"}
    use {"kana/vim-textobj-user"}
    use {"kana/vim-textobj-entire"}
  end
)
