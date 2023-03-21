%{
#include <stdio.h>
%}

%%
COMMENTTEST /* printf("This is a test comment!\n");*/


IF   printf("if_keyword TOKEN\n");
ELSE   printf("else_keyword TOKEN\n");
WHILE   printf("while_keyword TOKEN\n");
WRITE   printf("write_keyword TOKEN\n");
LINK   printf("link_keyword TOKEN\n");


NAME   printf("name_type TOKEN\n");
TEL   printf("tel_type TOKEN\n");
EMAIL   printf("email_type TOKEN\n");
GENDER   printf("gender_type TOKEN\n");
AGE   printf("age_type TOKEN\n");
STATE   printf("state_type TOKEN\n");
COUNTRY   printf("country_type TOKEN\n");
JOB   printf("job_type TOKEN\n");
INCOME   printf("income_type TOKEN\n");
INTEREST   printf("interest_type TOKEN\n");


\"[a-zA-Z]+[ \t]*[a-zA-Z]*\"   printf("string_literal TOKEN\n");
\"[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z]+.[a-zA-Z]+\"   printf("email_literal TOKEN\n");
\"[M|F]\"    printf("gender_literal TOKEN\n");
\"[0-9]{10}\"   printf("tel_literal TOKEN\n");
[0-9]+   printf("age_literal TOKEN\n");
$[0-9]+(.[0-9]+)?    printf("income_literal TOKEN\n");
([\"][a-zA-Z]+[\"][,]?[ \t]*)* printf("interest_literal TOKEN\n");
