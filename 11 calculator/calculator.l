
%{
#include<stdio.h>
int op = 0,i;
int a, b;
%}

dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
mod "%"
pow "^"
ln \n
%%


{dig} {digi();}
{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}
{mod} {op=5;}
{pow} {op=6;}
{ln} {printf("\n The Answer :%d\n\n",a);}

%%
digi()
{
if(op==0)

a=atof(yytext);

else
{ 
b=atof(yytext);

switch(op)
{
case 1:a=a+b;
	break;

case 2:a=a-b;
break;

case 3:a=a*b;
break;

case 4:a=a/b;
break;
case 5:a=a%b;
break;

case 6:for(i=a;b>1;b--)
a=a*i;
break;
}
op=0;
}
}

main(int argv,char *argc[], char opr)
{

yylex();
}

yywrap()
{
return 1;
}

