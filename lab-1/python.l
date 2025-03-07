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
"=" {tokenscounter["T_ASSIGN"]++;}
[a-zA-Z0-9_]? {tokenscounter["T_IDENT"]++;}



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


    yylex();

    for (auto& pair : tokenscounter){
        std::cout << pair.first << " -> " << pair.second << std::endl;

    } 

    fclose(yyin);
    return 0;
}