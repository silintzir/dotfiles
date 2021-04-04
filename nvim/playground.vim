function KeyValue(key, value)
  return a:key . '-' . a:value
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

let Temp = function('Reversed')

function Mapped(fn, l)
  let new_list = copy(a:l)
  call map(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction


let myList = [[1,2], [3, 4]]

echo Mapped(function('Reversed'), myList)










