vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

-- Function to toggle the location list window
function ToggleLocationList()
  -- Check if location list is currently open
  if vim.fn.exists ':lv' == 2 then
    -- Location list window is open, close it
    vim.cmd 'lclose'
  else
    local loclist = vim.fn.getloclist(0)
    if #loclist > 0 then
      -- Location list window is closed, open it
      vim.cmd 'lopen'
    end
  end
end

function ToggleRelativeNumbers()
  -- Get the current setting for number and relativenumber
  local number = vim.wo.number
  local relativenumber = vim.wo.relativenumber

  -- Toggle the settings
  if number == true and relativenumber == false then
    -- Both number and relativenumber are enabled
    vim.wo.relativenumber = true
  elseif relativenumber == true then
    -- Only relativenumber is enabled
    vim.wo.relativenumber = false
  else
    -- Both are disabled, enable number and relativenumber
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end

function ToggleWrap()
  -- Get the current setting for wrap
  local wrap = vim.wo.wrap

  -- Toggle the setting
  vim.wo.wrap = not wrap
end
