%{
#include <stdio.h>
#include <string.h>
#include "project.tab.h"


%}

%option noyywrap

%%
COMMENTTEST /* return This is a test comment!;*/
[ \t\n]+ /* Ignore whitespace */;

CONTACT   return contact_keyword;
IF   return if_keyword;
ELSE   return else_keyword;
WHILE   return while_keyword;
WRITE   return write_keyword;
LINK   return link_keyword;


NAME   return name_type;
TEL   return tel_type;
EMAIL   return email_type;
GENDER   return gender_type;
AGE   return age_type;
STATE   return state_type;
COUNTRY   return country_type;
JOB   return job_type;
INCOME   return income_type;
INTEREST   return interest_type;



\"[M|F]\"    {yylval=strdup(yytext); return gender_literal;}
\"[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z]+.[a-zA-Z]+\"   {yylval=strdup(yytext); return email_literal;}
\"[a-zA-Z]+([ \t]*[a-zA-Z]*)*\"   {yylval=strdup(yytext); return string_literal;}
[a-zA-Z_][a-zA-Z0-9_]*   return list_literal;
\"[0-9]{10}\"   {yylval=strdup(yytext); return tel_literal;}
[0-9]+   {yylval=atoi(yytext); return int_literal;}
([\"][a-zA-Z]+[\"][,]?[ \t]*)*   {yylval=strdup(yytext); return interest_literal;}



\<   return less_symbol;
>   return greater_symbol;
\{   return oparenthesis;
\}   return clparenthesis;
\(   return obracket;
\)   return clbracket;
\[   return opsqbracket;
\]   return clsqbracket;
\"   return quotation_symbol;
_   return underscore;
@   return at_symbol;
=   return assign_symbol;
,   return comma_symbol;
AND   return and_operator;
OR   return or_operator;
==   return equality_symbol;
\<=   return less_or_equal;
>=   return greater_or_equal;
\*   return multiply_operator;
\+   return add_operator;
-   return subtract_operator;
\/   return divide_operator;
     

%%

