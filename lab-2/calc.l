%option noyywrap

%{
    #include <iostream>
    #include "calc.tab.hpp"
    extern int yylex();
%}

%%

[ \t\n]               ;
[0-9]+\.?[0-9]*     { yylval.num = atof(yytext); return T_NUM; }

"+"                 { return T_PLUS; }
"-"                 { return T_MINUS; }
"*"                 { return T_MUL; }
"/"                 { return T_DIV; }

"("                 { return T_LPAREN; }
")"                 { return T_RPAREN; }

";"                 { return T_SEMI; }

.                   { std::cout << "Invalid character" << std::endl; exit(1);}
