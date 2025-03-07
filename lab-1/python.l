%option noyywrap
%{
    #include <iostream> 
    #include <map>
    #include <string>
    
    std::map < std::string, int > tokenscounter;
    int counter = 0;

%}

%%

[ \t\n]+

[0-9]+ {tokenscounter["T_INT"]++;}
[0-9]+\.[0-9]+ {tokenscounter["T_FLOAT"]++;}
[true|false]* {tokenscounter["T_BOOL"]++;}
[a-zA-Z0-9_]* {tokenscounter["T_IDENT"]++;}

//Task 4
"=" {tokenscounter["T_ASSIGN"]++;}
"+" {tokenscounter["T_ADD"]++;}
"-" {tokenscounter["T_SUB"]++;}
"*" {tokenscounter["T_MUL"]++;}
"/" {tokenscounter["T_DIV"]++;}
"<" {tokenscounter["T_LESS"]++;}
">" {tokenscounter["T_GREATER"]++;}
"<=" {tokenscounter["T_LESS_EQUAL"]++;}
">=" {tokenscounter["T_GREATER_EQUAL"]++;}
"==" {tokenscounter["T_EQUAL"]++;}
"%" {tokenscounter["T_PERCENTAGE"]++;}

//Task 5
if {tokenscounter["T_IF"]++;}
else {tokenscounter["T_ELSE"]++;}
while {tokenscounter["T_WHILE"]++;}
for {tokenscounter["T_FOR"]++;}



%%

int main(int argc, char* argv[]){
    if (argc < 2){
        std::cerr << "Usage: " << argv[0] << " <inpit file>" << std::endl;

        return 1;
    };

    yyin = fopen(argv[1], "r");
    if (!yyin){
        std::cerr << "Error opening file: " << argv[1] << std::endl;

        return 1;
    };

    tokenscounter["T_INT"] = 0;
    tokenscounter["T_FLOAT"] = 0;
    tokenscounter["T_BOOL"] = 0;
    tokenscounter["T_ASSIGN"] = 0;
    tokenscounter["T_IDENT"] = 0;
    tokenscounter["T_ASSIGN"] = 0;
    tokenscounter["T_ADD"] = 0;
    tokenscounter["T_SUB"] = 0;
    tokenscounter["T_MUL"] = 0;
    tokenscounter["T_DIV"] = 0;
    tokenscounter["T_LESS"] = 0;
    tokenscounter["T_GREATER"] = 0;
    tokenscounter["T_LESS_EQUAL"] = 0;
    tokenscounter["T_GREATER_EQUAL"] = 0;
    tokenscounter["T_EQUAL"] = 0;
    tokenscounter["T_PERCENTAGE"] = 0;


    yylex();

    for (auto& pair : tokenscounter){
        std::cout << pair.first << " -> " << pair.second << std::endl;

    } 

    fclose(yyin);
    return 0;
}