return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',

        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    }

    local set = vim.keymap.set
    set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = '[B]uffer next' })
    set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = '[B]uffer prev' })
    set('n', '<leader>bj', '<cmd>BufferLinePick<cr>', { desc = '[B]uffer [P]ick' })
    set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = '[B]uffer close [L]eft' })
    set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = '[B]uffer close [R]eft' })
    set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = '[B]uffer close [O]thers' })
  end,
}
