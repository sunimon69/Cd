%{
#include<stdio.h>
int flag=0;
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
                 printf("\nResult=%d\n",$$);
                 return 0;
                 }
E:E'+'E    {$$=$1+$3;}
  |E'-'E   {$$=$1-$3;}
  |E'*'E   {$$=$1*$3;}
  |E'/'E   {$$=$1/$3;}
  |E'%'E   {$$=$1%$3;}
  |'('E')' {$$=$2;}
  | NUMBER {$$=$1;}
  ;
  %%
  void main()
  {
  printf("\nenter any arithmetic expression which can have operations addition,subtraction,multiplication,division,modulus\n");
  yyparse();
  if(flag==0)
  printf("\nentered arithmetic expression is valid\n\n");
  }
  void yyerror()
  {
  printf("\nentered arithmetic expression is invalid\n\n");
  flag=1;
  }
               
                   
