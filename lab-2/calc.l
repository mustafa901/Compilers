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

"("                 { return T_LPA
REN; }
")"                 { return T_RPAREN; }

";"                 { return T_SEMI; }

"^"                 { return T_POW; } 
"|"                 { return T_ABS; } 

"sin"               { return T_SIN; }
"cos"               { return T_COS; }
"tan"               { return T_TAN; }
"pi"                { yylval.num = T_PI; return T_PI; } 

.                   { std::cout << "Invalid character" << std::endl; exit(1);}

%%