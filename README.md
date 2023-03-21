# apl-compiler

##Current Instructions:

###Example Running lex File with flex on Windows:
lex project.l
gcc lex.yy.c -o project1 -lfl OR gcc lex.yy.c -o project1 -L "C:\Flex Windows\Lex\lib" -lfl 
./project1
