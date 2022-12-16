%{
#include<stdio.h>
%}

%%
[a-z] printf("%c",yytext[0] - ('a' - 'A'));
0 { return 0;}
%%

int main()
{
  FILE *fp;
  fp = fopen("test.txt", "r");
  if (fp == NULL) { printf("File not found"); }
  yyin = fp;

  yylex();
  return 0;
}
