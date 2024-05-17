return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
  keys = {
    { '<leader>dt', '<cmd>TroubleToggle<CR>', desc = 'Trouble [D]iagnostics [T]oggle' },
    { '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = 'Trouble [D]iagnostics for [W]orkspace' },
    { '<leader>dd', '<cmd>TroubleToggle document_diagnostics<CR>', desc = 'Trouble: [D]ocument [D]iagnostics' },
    { '<leader>dq', '<cmd>TroubleToggle quickfix<CR>', desc = 'Trouble: [D]iagnostics [Q]uickfix' },
    { '<leader>dl', '<cmd>TroubleToggle loclist<CR>', desc = 'Trouble: [D]iagnostics [L]ocation list' },
    { '<leader>do', '<cmd>TodoTrouble<CR>', desc = 'Trouble: [D]iagnostics T[O]do' },
  },
}
