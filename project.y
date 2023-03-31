%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "project.tab.h"


void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
    return 1;
}
%}



%token contact_keyword if_keyword else_keyword while_keyword write_keyword link_keyword name_type tel_type email_type gender_type age_type state_type country_type job_type income_type interest_type less_symbol greater_symbol oparenthesis clparenthesis obracket clbracket opsqbracket clsqbracket quotation_symbol underscore at_symbol assign_symbol comma_symbol and_operator or_operator equality_symbol less_or_equal greater_or_equal multiply_operator add_operator subtract_operator divide_operator string_literal list_literal email_literal gender_literal tel_literal int_literal interest_literal

%%

commands:
    | commands command
    ;

command:
    declare_contact_list
    |
    declare_name
    |
    declare_tel
    |
    declare_email
    |
    declare_gender
    |
    declare_age
    |
    declare_state
    |
    declare_country
    |
    declare_job
    |
    declare_income
    |
    declare_interests
    |
    if_statement
    |
    while_loop
    |
    write_command
    ;

declare_contact_list:
    contact_keyword list_literal opsqbracket int_literal clsqbracket
    {
        printf("A contact was declared\n");
    }
    ;

declare_name:
    list_literal opsqbracket int_literal clsqbracket name_type assign_symbol string_literal
    {
        printf("A name was initialized\n");
    }
    ;

declare_tel:
    list_literal opsqbracket int_literal clsqbracket tel_type assign_symbol tel_literal
    {
        printf("A telephone number was initialized\n");
    }
    ;

declare_email:
    list_literal opsqbracket int_literal clsqbracket email_type assign_symbol email_literal
    {
        printf("An email was initialized\n");
    }
    ;

declare_gender:
    list_literal opsqbracket int_literal clsqbracket gender_type assign_symbol gender_literal
    {
        printf("A gender was initialized\n");
    }
    ;

declare_age:
    list_literal opsqbracket int_literal clsqbracket age_type assign_symbol int_literal
    {
        printf("An age was initialized\n");
    }
    ;

declare_state:
    list_literal opsqbracket int_literal clsqbracket state_type assign_symbol string_literal
    {
        printf("A state was initialized\n");
    }
    ;

declare_country:
    list_literal opsqbracket int_literal clsqbracket country_type assign_symbol string_literal
    {
        printf("A country was initialized\n");
    }
    ;

declare_job:
    list_literal opsqbracket int_literal clsqbracket job_type assign_symbol string_literal
    {
        printf("A job was initialized\n");
    }
    ;

declare_income:
    list_literal opsqbracket int_literal clsqbracket income_type assign_symbol int_literal
    {
        printf("An income was initialized\n");
    }
    ;

declare_interests:
    list_literal opsqbracket int_literal clsqbracket interest_type assign_symbol interest_literal 
    {
        printf("Interests were initialized\n");
    }
    ;
if_statement:
    if_keyword obracket condition clbracket oparenthesis commands clparenthesis
    {
        printf("If statement executed\n");
    }
    |
    if_keyword obracket condition clbracket oparenthesis commands clparenthesis else_keyword oparenthesis commands clparenthesis
    {
        printf("If-Else statement executed\n");
    }
    ;

condition:
    condition and_operator condition
    |
    condition or_operator condition
    |
    expression less_symbol expression
    |
    expression greater_symbol expression
    |
    expression equality_symbol expression
    |
    expression less_or_equal expression
    |
    expression greater_or_equal expression
    ;

while_loop:
    while_keyword obracket condition clbracket oparenthesis commands clparenthesis
    {
        printf("While loop executed\n");
    }
    ;
    

write_command:
    write_keyword obracket string_literal clbracket
    {
	printf("%s\n", $3);
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket clbracket
    {
        printf("Contact printed: %s[%d]\n", $3, $5);
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket income_type clbracket
    {
        printf("Income printed: %s[%d] #INCOME\n", $3, $5);
    }
    ;

expression:
    expression add_operator expression
    |
    expression subtract_operator expression
    |
    expression multiply_operator expression
    |
    expression divide_operator expression
    |
    list_literal opsqbracket int_literal clsqbracket
    |
    int_literal
    |
    string_literal
    ;

%%

int main()
{
    yyparse();
    return 0;
}


