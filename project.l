%{
#include <stdio.h>
%}

%%
COMMENTTEST /* printf("This is a test comment!\n");*/



\"[a-zA-Z]+[ \t]*[a-zA-Z]*\"   printf("string_literal TOKEN\n");
\"[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z]+.[a-zA-Z]+\"   printf("email_literal TOKEN\n");
\"[M|F]\"    printf("gender_literal TOKEN\n");
\"[0-9]{10}\"   printf("tel_literal TOKEN\n");
[0-9]+   printf("age_literal TOKEN\n");
$[0-9]+(.[0-9]+)?    printf("income_literal TOKEN\n");
([\"][a-zA-Z]+[\"][,]?[ \t]*)* printf("interest_literal TOKEN\n");
