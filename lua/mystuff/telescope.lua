require('telescope').load_extension('fzy_native')

local actions = require('telescope.actions')
local main = {}

local center_list = require'telescope.themes'.get_dropdown({
    width = 0.5,
    results_title = false,
    results_height = 20,
    previewer = false,
})

local with_preview = require'telescope.themes'.get_dropdown({
    results_title = false,
    results_height =  20,
    shorten_path = true,
    prompt_position = 'top',
    layout_strategy = 'horizontal',
    width = 0.75,
    vimgrep_arguments = { 'rg', '--hidden', '--with-filename', '--line-number', '--no-heading', '--column', '--color=never' }
})

require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending',
    shorten_path = false,
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' > ',
    entry_prefix = '   ',
    selection_caret = ' > ',
    set_env = {['COLORTERM'] = 'truecolor'},
    color_devicons = true,
    file_previewer =    require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer =    require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer =  require('telescope.previewers').vim_buffer_qflist.new,
    color_devicons = true,
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-q>'] = actions.send_to_qflist,
      }
    },
  },
  extensions = {
    fzy_native = {
      oterride_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

main.find_files = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = 'Find in project'
  opts.find_command = { 'rg', '--hidden', '--files' }
  require('telescope.builtin').find_files(opts)
end

main.buffers = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = 'Find in open buffers'
  opts.find_command = { 'rg', '--hidden', '--files' }
  require('telescope.builtin').buffers(opts)
end

main.grep_string = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.input('Grep for > ')
  opts.prompt_title = 'Filter results'
  require('telescope.builtin').grep_string(opts)
end

main.live_grep = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = 'Live search'
  require('telescope.builtin').live_grep(opts)
end

main.file_browser = function()
  require('telescope.builtin').file_browser({
    initial_mode = 'normal'
  })
end

main.search_dotfiles = function ()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = 'Find in dotfiles'
  opts.cwd = "$HOME/Projects/dotfiles/"
  opts.results_height = 10
  require('telescope.builtin').find_files(opts)
end

main.git_branches = function()
  require('telescope.builtin').git_branches({
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<c-d>', actions.git_delete_branch)
      map('n', '<c-d>', actions.git_delete_branch)
      return true
    end
  })
end

return main
