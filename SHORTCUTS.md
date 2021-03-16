##### The `g` command

`gv`: reselects text according to the last visual selection

`g<`: show the output of the last command (errors, resutls, etc)

##### The `z` command

`zz`: puts the line we edit in the center of the screen

##### Insert mode shortcuts

`^w`: deletes last word entered

`^u`: deletes up to the beginning of the line

`^r`: allows a register to be pasted into the text

##### Command mode

`@:`: executes the last command again using (current line is always taken into account)

`^d`: gets auto suggestions while in the middle of typing a command

`^r^w`: takes and puts the current word on the command line

`^r^a`: takes and puts the current WORD on the command line

`q:`: opens the command line window with the history of Ex commands

`q/`: opens the command line window with the history of searches

##### Marks

`m{letter}`: set a mark. lowercase letters can be used inside the file. Upper case are global.

`'{letter}`: takes to the first non-empty character in the line with the mark.

`{letter}`: takes to the exact point where the mark was set.

##### Navigate with jumps

`^o`: backward jump

`^i`: backward jump

`g;`: traverse backward in the change list

`g,`: traverse forward in the change list

`gi`: traverse to last edit and enter insert mode. like `g;i`

##### Searches

`/`: to search forward. `n` and `N` to give next previous result with the direction of the search

`?`: to search backward. `n` and `N` to give next previous result with the direction of the search

`gn`: enables character wise visual mode and selects next search match

`gN`: enables character wise visual mode and selects previous search match

`^r^w`: autocompletes the search pattern with the word under the match preview
