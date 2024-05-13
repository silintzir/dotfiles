return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>sS', '<cmd>Spectre<cr>', { desc = '[S]earch: Spectre' })
  end,
}
