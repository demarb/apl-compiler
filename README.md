# apl-compiler
ContactScript was designed by Odane Walters, Jhimani Henry and
Demar Brown. The language is built with a Java frontend and C backend using lexx and yacc.

The intent in designing the language was to create a procedural, high level language to target the contact management domain to organize, store and manage contact information.

##Features
  1. Can define a list of contacts of any length.
  2. Fields stored=> NAME, TEL, AGE, EMAIL, GENDER, STATE, COUNTRY, JOB,
  INCOME, INTEREST
  3. Show all contacts in our list
  Show a contact by index without user writing loops.
  5. Show the property of a contact at a index without user writing loops.
  6. Assigning INCOME field based on calculations using [+,- , / *]
  7. Disclaimer: IF statement was attempted but not functioning as expected. Needs to be fixed.
  8. Disclaimer: Left Hand Assignment was not attempted for two reasons:
    a. Ambiguity - clearness of what statements mean is not consistent with the intent
    being designing a language for the domain
    b. Readbility, Writability and Reliability subsequently negatively affected.
## Instructions:

### Example Running compiler with flex and yacc on Windows in CMD:
1. flex project.l
2. bison -d -o project.tab.c project.y
3. gcc lex.yy.c project.tab.c -o project
4. project

###Running Via GUI:
Options: 
  1. Browse and select .txt file with code and compile
  2. Type code directly in top section of GUI and compile.
  
  
##Disclaimer
To make the language more complex, considerations would need to be made in terms of the implementation of semantics.
