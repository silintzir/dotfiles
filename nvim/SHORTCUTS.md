Useful Shortcuts
================

Navigation shortcuts
---------------------

- `<CTRL-w>` is used across the following commands to control how we move and manage windows:
  - `w`: moves to the next window (`:h winnr` to see how windows are numbered)
  - `p`: moves to the last accessed window (`#` option for `winnr`)
  - `h|j|k|l`: move between windows with implied direction
  - `n`: opens a new empty window
  - `o`: make the current window the only visible window on screen
  - `=`: gives equal space to all visible windows
  - `r`: rotates windows
- `<CTRL-^`: switches to alternate buffer

Insert mode shortcuts
---------------------

- `<CTRL-w>`: deletesletes last word
- `<CTRL-h`: deletes last character
- `<CTRL-u`: deletes up to beginning of the line
- `<CTRL-l`: forward deletes (DEL) a character - *(this is a custom mapping)*
- `<CTRL-t`: indent one tab
- `<CTRL-d`: remove one indent tab
- `<CTRL-r`: can paste from a register
  - by using register `=` we switch to command line and execute a mathematical calculation or any other command like `system('ls')` and put the result of the exepression in the text
- `<CTRL-n`: triggers auto complete
- `<CTRL-o`: activates insert sub-mode where a command may be executed

Marks
------------------

- `a-z` are valid inside a file and can be used with motions. `A-Z` are global.
- `m` to set a mark
- `'` to get back to the beginning of the line where the mark is set.
- Special marks are unlisted and mostly used by scripts and internal commands.

Registers
--------------------

- `:echo @` to view the output of a hypotheticall register `b` from command line or scripts.
- to yank in hypothetical register `b` use `"by`
- to put from hypothetical register `b`, use `"bp`
- special registers:
  - `".` has the last inserted text
  - `"%` has the current file path
  - `"#` has the name of the alternate file
  - `":` has the last command executed
  - `"/` has the last search text searched with `/`, `?`, `*`, `#`
  - `"+` is the system clipboard and can be used to copy/paste outside vim

