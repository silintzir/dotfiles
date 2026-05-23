return {
  'echasnovski/mini.icons',
  priority = 1100,
  config = function()
    require('mini.icons').setup()
    require('mini.icons').mock_nvim_web_devicons()
  end,
}
