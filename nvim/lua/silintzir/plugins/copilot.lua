return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  dependencies = {
    'zbirenbaum/copilot-cmp',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('copilot').setup()
    require('copilot_cmp').setup()
  end,
}
