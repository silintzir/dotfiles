return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'md', 'mdx' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('render-markdown').setup {}
  end,
}
