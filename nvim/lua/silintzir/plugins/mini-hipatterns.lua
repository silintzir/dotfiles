return {
  'echasnovski/mini.hipatterns',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('mini.hipatterns').setup {
      highlighters = {
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      },
    }
  end,
}
