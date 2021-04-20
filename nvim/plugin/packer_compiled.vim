" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/silintzir/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/silintzir/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/silintzir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/silintzir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/silintzir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.coc\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["editorconfig-vim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.editorconfig\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.formatter\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/silintzir/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  }
}

time("Defining packer_plugins", false)
-- Config for: coc.nvim
time("Config for coc.nvim", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.coc\frequire\0", "config", "coc.nvim")
time("Config for coc.nvim", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: editorconfig-vim
time("Config for editorconfig-vim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.editorconfig\frequire\0", "config", "editorconfig-vim")
time("Config for editorconfig-vim", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.formatter\frequire\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
