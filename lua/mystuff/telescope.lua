require('telescope').load_extension('fzy_native')

local actions = require('telescope.actions')
local devicons = require('nvim-web-devicons')
local entry_display = require('telescope.pickers.entry_display')
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

local my_make_entry = {}

local filter = vim.tbl_filter
local map = vim.tbl_map

function my_make_entry.gen_from_buffer_like_leaderf(opts)
  opts = opts or {}
  local default_icons, _ = devicons.get_icon('file', '', {default = true})

  local bufnrs = filter(function(b)
    return 1 == vim.fn.buflisted(b)
  end, vim.api.nvim_list_bufs())

  local max_bufnr = math.max(unpack(bufnrs))
  local bufnr_width = #tostring(max_bufnr)

  local max_bufname = math.max(
    unpack(
      map(function(bufnr)
        return vim.fn.strdisplaywidth(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':p:t'))
      end, bufnrs)
    )
  )

  local displayer = entry_display.create {
    separator = " ",
    items = {
      { width = bufnr_width },
      { width = 8 },
      { width = vim.fn.strwidth(default_icons) },
      { width = max_bufname },
      { remaining = true },
    },
  }

  local make_display = function(entry)
    return displayer {
      {entry.bufnr, "TelescopeResultsNumber"},
      {entry.indicator, "TelescopeResultsComment"},
      {entry.devicons, entry.devicons_highlight},
      entry.file_name,
      {entry.dir_name, "Comment"}
    }
  end

  return function(entry)
    local bufname = entry.info.name ~= "" and entry.info.name or '[No Name]'
    local hidden = entry.info.hidden == 1 and 'h' or 'a'
    local readonly = vim.api.nvim_buf_get_option(entry.bufnr, 'readonly') and '=' or ' '
    local changed = entry.info.changed == 1 and '+' or ' '
    local indicator = entry.flag .. hidden .. readonly .. changed

    local dir_name = vim.fn.fnamemodify(bufname, ':.:h')
    local file_name = vim.fn.fnamemodify(bufname, ':p:t')

    local icons, highlight = devicons.get_icon(bufname, string.match(bufname, '%a+$'), { default = true })

    return {
      valid = true,

      value = bufname,
      ordinal = entry.bufnr .. " : " .. file_name,
      display = make_display,

      bufnr = entry.bufnr,

      lnum = entry.info.lnum ~= 0 and entry.info.lnum or 1,
      indicator = indicator,
      devicons = icons,
      devicons_highlight = highlight,

      file_name = file_name,
      dir_name = dir_name,
    }
  end
end

main.buffers = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = 'Find in open buffers'
  opts.find_command = { 'rg', '--hidden', '--files' }
  opts.entry_maker = my_make_entry.gen_from_buffer_like_leaderf()
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
