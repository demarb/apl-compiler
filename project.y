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

typedef struct{
	char name[32];
	char tel[14];
	int age;
	char email[32];
	char gender[5];
	char state[42];
	char country[42];
	char job[32];
	int income;
	char interest[122];
}contactListsStruct;



contactListsStruct* contactListArr_Ptr;

int arrSize;

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

	arrSize = $4;
	contactListArr_Ptr = malloc(arrSize * sizeof(contactListsStruct));
	
	for(int i=0; i<arrSize; i++)
	{
		
		strcpy(contactListArr_Ptr[i].name, "NULL");
		strcpy(contactListArr_Ptr[i].tel, "NULL");
		strcpy(contactListArr_Ptr[i].email, "NULL");
		strcpy(contactListArr_Ptr[i].gender, "NULL");
		contactListArr_Ptr[i].age= 0;
		strcpy(contactListArr_Ptr[i].state, "NULL");
		strcpy(contactListArr_Ptr[i].country, "NULL");
		strcpy(contactListArr_Ptr[i].job, "NULL");
		contactListArr_Ptr[i].income= 0;
		strcpy(contactListArr_Ptr[i].interest, "NULL");
	}


	printf("A contact was declared\n");

    }
    ;

declare_name:
    list_literal opsqbracket int_literal clsqbracket name_type assign_symbol string_literal
    {

	strcpy(contactListArr_Ptr[$3].name, (char*) $7);
	contactListArr_Ptr[$3].name[32] = '\0';
	printf("A name was initialized: %s\n", contactListArr_Ptr[$3].name);

	
    }
    ;

declare_tel:
    list_literal opsqbracket int_literal clsqbracket tel_type assign_symbol tel_literal
    {
        strcpy(contactListArr_Ptr[$3].tel, (char*) $7);
	contactListArr_Ptr[$3].tel[14] = '\0';
	printf("A telephone was initialized: %s\n", contactListArr_Ptr[$3].tel);
    }
    ;

declare_email:
    list_literal opsqbracket int_literal clsqbracket email_type assign_symbol email_literal
    {
        strcpy(contactListArr_Ptr[$3].email, (char*) $7);
	contactListArr_Ptr[$3].email[32] = '\0';
	printf("A email was initialized: %s\n", contactListArr_Ptr[$3].email);
    }
    ;

declare_gender:
    list_literal opsqbracket int_literal clsqbracket gender_type assign_symbol gender_literal
    {
        strcpy(contactListArr_Ptr[$3].gender, (char*) $7);
	contactListArr_Ptr[$3].gender[5] = '\0';
	printf("A gender was initialized: %s\n", contactListArr_Ptr[$3].gender);
    }
    ;

declare_age:
    list_literal opsqbracket int_literal clsqbracket age_type assign_symbol int_literal
    {
        contactListArr_Ptr[$3].age= $7;
	printf("A age was initialized: %d\n", contactListArr_Ptr[$3].age);
    }
    ;

declare_state:
    list_literal opsqbracket int_literal clsqbracket state_type assign_symbol string_literal
    {
        strcpy(contactListArr_Ptr[$3].state, (char*) $7);
	contactListArr_Ptr[$3].state[42] = '\0';
	printf("A state was initialized: %s\n", contactListArr_Ptr[$3].state);
    }
    ;

declare_country:
    list_literal opsqbracket int_literal clsqbracket country_type assign_symbol string_literal
    {
        strcpy(contactListArr_Ptr[$3].country, (char*) $7);
	contactListArr_Ptr[$3].country[42] = '\0';
	printf("A country was initialized: %s\n", contactListArr_Ptr[$3].country);
    }
    ;

declare_job:
    list_literal opsqbracket int_literal clsqbracket job_type assign_symbol string_literal
    {
        strcpy(contactListArr_Ptr[$3].job, (char*) $7);
	contactListArr_Ptr[$3].job[32] = '\0';
	printf("A job was initialized: %s\n", contactListArr_Ptr[$3].job);
    }
    ;

declare_income:
    list_literal opsqbracket int_literal clsqbracket income_type assign_symbol expression
    {

	contactListArr_Ptr[$3].income= $7;
	printf("A income was initialized: $%d\n", contactListArr_Ptr[$3].income);
    } 

    ;

declare_interests:
    list_literal opsqbracket int_literal clsqbracket interest_type assign_symbol interest_literal 
    {
        strcpy(contactListArr_Ptr[$3].interest, (char*) $7);
	contactListArr_Ptr[$3].interest[122] = '\0';
	printf("A interest was initialized: %s\n", contactListArr_Ptr[$3].interest);
    }
    ;
if_statement:
    if_keyword obracket condition clbracket oparenthesis commands clparenthesis
    {
        printf("If statement executed\n");
    }
     ;


    /*
    |
    if_keyword obracket condition clbracket oparenthesis commands clparenthesis else_keyword oparenthesis commands clparenthesis
    {
        printf("If-Else statement executed\n");
    }
    ;*/


/*
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
*/


condition:
    name_type equality_symbol string_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if ((strcmp(contactListArr_Ptr[i].name, (char*) $3))==0){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     age_type equality_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].age == $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     age_type less_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].age < $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     age_type greater_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].age > $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     age_type less_or_equal int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].age <= $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     age_type greater_or_equal int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].age >= $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
    country_type equality_symbol string_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if ((strcmp(contactListArr_Ptr[i].country, (char*) $3))==0){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     income_type equality_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].income == $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     income_type less_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].income < $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     income_type greater_symbol int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].income > $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     income_type less_or_equal int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].income <= $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
     income_type greater_or_equal int_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if (contactListArr_Ptr[i].income >= $3){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
    state_type equality_symbol string_literal 
    {
	for(int i=0; i<arrSize; i++)
	{
		if ((strcmp(contactListArr_Ptr[i].state, (char*) $3))==0){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }


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
    write_keyword obracket list_literal clbracket
    {
	printf("CONTACTS STORED: \n");
	for(int i=0; i<arrSize; i++)
	{
		printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket clbracket
    {
        printf("CONTACT REQUESTED: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s %s %s %s %d %s %s %s %d %s\n", contactListArr_Ptr[i].name, contactListArr_Ptr[i].tel, contactListArr_Ptr[i].email, contactListArr_Ptr[i].gender, contactListArr_Ptr[i].age, contactListArr_Ptr[i].state, contactListArr_Ptr[i].country, contactListArr_Ptr[i].job, contactListArr_Ptr[i].income, contactListArr_Ptr[i].interest);
		}
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket name_type clbracket
    {
        printf("Name for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].name);
		}
	}
    }
    |
     write_keyword obracket list_literal opsqbracket int_literal clsqbracket tel_type clbracket
    {
        printf("Telephone for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].tel);
		}
	}
    }
    |
     write_keyword obracket list_literal opsqbracket int_literal clsqbracket email_type clbracket
    {
        printf("Email for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].email);
		}
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket gender_type clbracket
    {
        printf("Gender for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].gender);
		}
	}
    } 
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket age_type clbracket
    {
        printf("Age for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%d\n", contactListArr_Ptr[i].age);
		}
	}
    }

    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket state_type clbracket
    {
        printf("State for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].state);
		}
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket country_type clbracket
    {
        printf("Country for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].country);
		}
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket job_type clbracket
    {
        printf("Country for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].job);
		}
	}
    }
    |
    write_keyword obracket list_literal opsqbracket int_literal clsqbracket income_type clbracket
    {
        printf("Income for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%d\n", contactListArr_Ptr[i].income);
		}
	}
    }

    |
     write_keyword obracket list_literal opsqbracket int_literal clsqbracket interest_type clbracket
    {
        printf("Interest for requested contact: \n");
	for(int i=0; i<arrSize; i++)
	{
		if (($5)==i){
			printf("%s\n", contactListArr_Ptr[i].interest);
		}
	}
    }
    ;


expression:
    int_literal
    {
	$$ = $1;
    }
    |
    int_literal add_operator int_literal
    {
	$$ = $1 + $3;
    }

    |
    int_literal subtract_operator int_literal
    {
	$$ = $1 - $3;
    }

    |
    int_literal multiply_operator int_literal
    {
	$$ = $1 * $3;
    }
    |
    int_literal divide_operator int_literal
    {
	$$ = $1 / $3;
    }
   
    ;




%%

int main()
{
    yyparse();
    return 0;
}


