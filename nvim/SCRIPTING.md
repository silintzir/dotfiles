Learn Vim scripting the hard way
================================

#### [Variable scoping]( https://learnvimscriptthehardway.stevelosh.com/chapters/20.html )
----------------

> sets a variable with buffer scope

`let b:hello = "some value"`

#### [Comparisons](https://learnvimscriptthehardway.stevelosh.com/chapters/22.hthl)

use `==?` to compare in a case-insensitive mode and `==#` to compare in case-sensitive

#### [Functions](https://learnvimscriptthehardway.stevelosh.com/chapters/23.html)

when a function does not explicitly return a value, it implicitly returns 0

```vim
function HelloWorld()
  echo "Hello world!"
endfunction

:call HelloWorld() " will output Hello world!
:echo HelloWorld() " will output Hello world and then 0

```

#### [Strings](https://learnvimscriptthehardway.stevelosh.com/chapters/26.html)

to concatenate, use the `.` operator. `+` can only be used for number operations

literal strings use single quotes and do not need escaping

#### [String functions](https://learnvimscriptthehardway.stevelosh.com/chapters/27.html)

- `strlen("foo") " outputs 3`
- `split("hello world") " outputs ["hello", "world"]`
- `join(['one', 'two', 'tree'], ' - ') " outputs "one - two - three"`
- `tolower("FOO")`
- `toupper("foo")`

#### [Execute](https://learnvimscriptthehardway.stevelosh.com/chapters/28.html)

```vim
:execute "rightbelow vsplit " . bufname("#")
```

this will open the alternate buffer in a vertical split

#### [Normal](https://learnvimscriptthehardway.stevelosh.com/chapters/29.html)

```vim
:nnoremap G dd
:normal G " will delete the line - :normal takes into account any mapping set"
:normal! G " will not delete the line - instead will move to the end of the file";
:normal! /foo<cr> " will not execute because the <cr> cannot be recognized. loot at execute"
```

#### [Execute normal!](https://learnvimscriptthehardway.stevelosh.com/chapters/30.html)

```vim
:execute "normal! mqA;\<esc>`q"
:help expr-quote " to see how to escape strings to pass to normal with execute  
```


