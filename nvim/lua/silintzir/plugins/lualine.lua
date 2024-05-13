return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local line = require 'lualine'

    line.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        globalstatus = false,
        disabled_filetypes = {
          'neo-tree',
        },
      },
      sections = {
        lualine_b = { 'branch', 'diagnostics' },
        lualine_x = {
          {
            function()
              local msg = 'No Active Lsp'
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              local attached_clients = {}
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  table.insert(attached_clients, client.name)
                end
              end
              return table.concat(attached_clients, ' ~ ')
            end,
            icon = ' ',
            color = { fg = '#ff9e64' },
          },
          {

            function()
              local linters = require('lint').get_running()
              if #linters == 0 then
                return ''
              end
              return table.concat(linters, ' ~ ')
            end,
            icon = '󱉶 ',
            color = { fg = '#ff9e64' },
          },
          'filetype',
        },
      },
      inactive_sections = {
        lualine_x = { 'filetype', 'location' },
      },
    }
  end,
}
