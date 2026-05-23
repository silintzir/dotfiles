return {
  { -- Linting (ESLint via LSP; shell/markdown via nvim-lint)
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        markdown = { 'markdownlint-cli2' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        zsh = { 'shellcheck' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          local ft = vim.bo.filetype
          if not lint.linters_by_ft[ft] then
            return
          end
          require('lint').try_lint()
        end,
      })
    end,
  },
}
