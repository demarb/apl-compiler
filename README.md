# apl-compiler

## Current Instructions:

### Example Running lex File with flex on Windows in CMD:
1. flex project.l
2. bison -d -o project.tab.c project.y
3. gcc lex.yy.c project.tab.c -o project
4. project
