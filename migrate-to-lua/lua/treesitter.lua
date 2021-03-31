local sit = require'nvim-treesitter.configs'
sit.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {"typescript"}
  }
}

