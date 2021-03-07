local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' > ',
    color_devicons = true,
    file_previewer =    require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer =    require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer =  require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-q>'] = actions.send_to_qflist,
      }
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

local M = {}

M.find_files = function()
  require('telescope.builtin').find_files({
    find_command = { 'rg', '--hidden', '--files' }
  })
end

M.grep_this_string = function()
  require('telescope.builtin').grep_string({
    entry_prefix = '   ',
    selection_caret = ' > ',
    search = vim.fn.input('Grep for > '),
    vimgrep_arguments = { 'rg', '--hidden', '--with-filename', '--line-number', '--no-heading', '--column', '--color=never' }
  })
end

M.grep_a_string = function()
  require('telescope.builtin').grep_string({
    entry_prefix = '   ',
    selection_caret = ' > ',
  })
end

M.search_dotfiles = function ()
  require('telescope.builtin').find_files({
    prompt_title = "< VimRC >",
    cwd = "$HOME/dotfiles/"
  })
end

M.git_branches = function()
  require('telescope.builtin').git_branches({
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<c-d>', actions.git_delete_branch)
      map('n', '<c-d>', actions.git_delete_branch)
      return true
    end
  })
end

return M
