
%{
#include <stdio.h>
%}

COMECO [^\-\_\.a-zA-Z0-9]
FIM [^\-\_a-zA-Z0-9]
ALPHANUMERICO [a-zA-Z0-9]
ALPHAOUESP [a-zA-Z0-9\.\-\_]


%%

{ALPHAOUESP}*{ALPHANUMERICO}@{ALPHANUMERICO}{ALPHAOUESP}*  {int i; char aux[800]; for(i=0;yytext[i]!='\0';i++); if(yytext[0]!='-' && yytext[0]!='_' && yytext[0]!='.' && yytext[i-1]!='-' && yytext[i-1]!='_'){if(yytext[i-1]!='.') printf("%s\n",yytext); else{ for(int j=0;j<i-1;j++) printf("%c",yytext[j]); printf("\n"); }} }

[:space:] ;
[^:space:] ;


%%

int main() {
  yylex();
  return 0;
}

//for(i=0;yytext[i];i++){aux[i]=yytext[i+1];}
