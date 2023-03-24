%{
#include <stdio.h>
%}

%%
COMMENTTEST /* printf("This is a test comment!\n");*/


IF   printf("if_keyword\n");
ELSE   printf("else_keyword\n");
WHILE   printf("while_keyword\n");
WRITE   printf("write_keyword\n");
LINK   printf("link_keyword\n");


NAME   printf("name_type\n");
TEL   printf("tel_type\n");
EMAIL   printf("email_type\n");
GENDER   printf("gender_type\n");
AGE   printf("age_type\n");
STATE   printf("state_type\n");
COUNTRY   printf("country_type\n");
JOB   printf("job_type\n");
INCOME   printf("income_type\n");
INTEREST   printf("interest_type\n");


\"[M|F]\"    printf("gender_literal\n");
\"[a-zA-Z]+([ \t]*[a-zA-Z]*)*\"   printf("string_literal\n");
\"[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z]+.[a-zA-Z]+\"   printf("email_literal\n");
\"[0-9]{10}\"   printf("tel_literal\n");
[0-9]+   printf("age_literal\n");
$[0-9]+(.[0-9]+)?    printf("income_literal\n");
([\"][a-zA-Z]+[\"][,]?[ \t]*)* printf("interest_literal\n");


\<   printf("less_symbol\n");
>   printf("greater_symbol\n");
\{   printf("oparenthesis\n");
\}   printf("clparenthesis\n");
\(   printf("obracket\n");
\)   printf("clbracket\n");
\[   printf("opsqbracket\n");
\]   printf("clsqbracket\n");
\"   printf("quotation_symbol\n");
_   printf("underscore\n");
@   printf("at_symbol\n");
=   printf("assign_symbol\n");
,   printf("comma_symbol\n");
AND   printf("and_operator\n");
OR   printf("or_operator\n");
==   printf("equality_symbol\n");
\<=   printf("less_or_equal\n");
>=   printf("greater_or_equal\n");
\*   printf("multiply_operator\n");
\+   printf("add_operator\n");
-   printf("subtract_operator\n");
\/   printf("divide_operator\n");

%%