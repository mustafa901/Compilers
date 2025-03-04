%option noyywrap
%{
    #include <iostream>    
%}

%%



%%

int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yylex();

    return 0;
}