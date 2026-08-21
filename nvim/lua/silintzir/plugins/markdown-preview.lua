return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown', 'mdx' },
  build = 'cd app && npx --yes yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown', 'mdx' }
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = 'dark'
  end,
  keys = {
    {
      '<leader>mp',
      '<cmd>MarkdownPreviewToggle<cr>',
      ft = { 'markdown', 'mdx' },
      desc = '[M]arkdown [P]review toggle',
    },
  },
}
