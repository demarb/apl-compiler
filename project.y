%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
        return 1;
} 
  
main()
{
        yyparse();
} 

%}

%token contact_keyword if_keyword else_keyword while_keyword write_keyword link_keyword name_type tel_type email_type gender_type age_type state_type country_type job_type income_type interest_type less_symbol greater_symbol oparenthesis clparenthesis obracket clbracket opsqbracket clsqbracket quotation_symbol underscore at_symbol assign_symbol comma_symbol and_operator or_operator equality_symbol less_or_equal greater_or_equal multiply_operator add_operator subtract_operator divide_operator string_literal list_literal email_literal gender_literal tel_literal int_literal income_literal interest_literal


commands:
        | commands command
        ;

command:
        declare_contact_list
        |
        declare_email
        ;

declare_contact_list:
	contact_keyword list_literal opsqbracket int_literal clsqbracket
	{
		printf("A contact was declared\n");
	}
	;

declare_email:
	list_literal opsqbracket int_literal clsqbracket email_type assign_symbol email_literal
	{
		printf("A email was initialized\n");
	}
	;