return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = false }
      end,
      mode = '',
      desc = '[C]ode [F]ormat',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true, php = true }
      local conform_only = {
        typescript = true,
        javascript = true,
        javascriptreact = true,
        typescriptreact = true,
        svelte = true,
        css = true,
        html = true,
        json = true,
        jsonc = true,
        markdown = true,
      }
      local ft = vim.bo[bufnr].filetype
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[ft] and not conform_only[ft],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      typescript = { 'prettierd', stop_after_first = true },
      javascript = { 'prettierd', stop_after_first = true },
      javascriptreact = { 'prettierd', stop_after_first = true },
      typescriptreact = { 'prettierd', stop_after_first = true },
      svelte = { 'prettierd', stop_after_first = true },
      css = { 'prettierd', stop_after_first = true },
      json = { 'biome', 'prettierd', stop_after_first = true },
      jsonc = { 'prettierd', stop_after_first = true },
      ejs = { 'prettierd', stop_after_first = true },
      html = { 'prettierd', stop_after_first = true },
      markdown = { 'prettierd', stop_after_first = true },
    },
  },
}
