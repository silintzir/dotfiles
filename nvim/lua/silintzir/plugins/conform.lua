return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[C]ode [F]ormat',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, php = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
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
      json = { 'biome', stop_after_first = true },
      jsonc = { 'prettierd', stop_after_first = true },
      ejs = { 'prettierd', stop_after_first = true },
      html = { 'prettierd', stop_after_first = true },
      markdown = { 'prettierd', stop_after_first = true },
    },
  },
}
