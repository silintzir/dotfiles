-- Requires: tree-sitter-cli, tar, curl, and a C compiler (pacman: tree-sitter-cli gcc)
local languages = {
  'bash',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'vim',
  'vimdoc',
  'typescript',
  'javascript',
  'tsx',
  'css',
  'json',
  'graphql',
  'prisma',
  'svelte',
  'yaml',
  'dockerfile',
  'gitignore',
  'query',
}

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('silintzir-treesitter', { clear = true }),
      pattern = languages,
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo.foldmethod = 'expr'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require('nvim-ts-autotag').setup {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    }
  end,
}
