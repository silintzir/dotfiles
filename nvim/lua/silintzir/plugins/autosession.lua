return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Projects/', '~/Downloads', '~/Documents', '~/Desktop/' },
      pre_save_cmds = { 'Neotree close' },
      post_restore_cmds = { 'Neotree filesystem show', 'wincmd =' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>wR', '<cmd>SessionRestore<CR>', { desc = '[W]orkspace session [R]eload' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>wS', '<cmd>SessionSave<CR>', { desc = '[W]orkspace session [S]save' }) -- save workspace session for current working directory
  end,
}
