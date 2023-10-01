package compilador2;

import static compilador2.token.*;

%%

%{
    private void imprimir(String token, String lexema) {
        System.out.println(lexema + "==>> " + token);
    }
%}

%class Lexer
%type Token

palavraChave = "for" | "while" | "class" | "do" | "int" | "if" | "private" | 
"public" | "String" | "static" | "void" | "Main" | "using" | "system" | "try" | 
"catch" | "throw" | "finally" | "bool" | "const" | "enum" | "foreach" | "struct" | 
"do-while" | "return" | "break" | "Console" | "WriteLine" | "continue" | "as" | "base" | "checked" | 
"default" | "delegate" | "event" | "explicit" | "extern" | "false" | "fixed" | "implicit" | "in" | "interface" | 
"internal" | "is" | "lock" | "namespace" | "new" | "null" | "object" | "operator" | "out" | "override" | "params" 
| "readonly" | "ref" | "sealed" | "sizeof" | "stackalloc" | "this" | "throw" | "true" | "typeof" | "unchecked" | "unsafe" |
 "ushort" | "using" | "virtual" | "volatile" | "while";
nomeVariavel = [_a-zA-Z][_a-zA-z0-9]*
inteiro = [0-9]+
decimal = [0-9]+"["."]"+[0-9]+
comentario = "/*" [^*] ~"*/" | "//"
branco = [\t\n\r ]+
operadoresAritmeticos = "+" | "-" | "*" | "/" | "%"
operadoresComparacao = "<>" | ">" | "<" | "<=" | ">=" | "==" | "="
simbolosEspeciais = "(" | ")" | "[" | "]" | "." | "," | ";" | "{" | "}" | ":" | "$" | "'" | "“" 
operadoresLogicos = "&&" | "||" | "!"
underline = "_"
vogaisAcentos = "á" | "ã" | "é" | "ó" | "ú" | "ão"
aspasDuplas = "\""




%%

{palavraChave}          { imprimir("PALAVRA_CHAVE : ", yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          { imprimir("NOME_VARIAVEL : ", yytext()); return NOME_VARIAVEL; }
{inteiro}               { imprimir("INTEIRO : ", yytext()); return INTEIRO; }
{decimal}               { imprimir("DECIMAL : ", yytext()); return DECIMAL; }
{comentario}            { imprimir("COMENTARIO : ", yytext()); return COMENTARIO; }
{branco}                { return BRANCO; }
{operadoresAritmeticos} { imprimir("OPERADORES_ARITMETICOS : ", yytext()); return OPERADORES_ARITMETICOS; }
{operadoresComparacao}  { imprimir("OPERADORES DE COMPRACAO : ", yytext()); return OPERADORES_COMPARACAO; }
{simbolosEspeciais}     { imprimir("SIMBOLOS ESPECIAIS : ", yytext()); return SIMBOLOS_ESPECIAIS; }
{operadoresLogicos}     { imprimir("OPERADORES LOGICOS : ", yytext()); return OPERADORES_LOGICOS; }
{underline}             { imprimir("UNDERLINE : ", yytext()); return UNDERLINE; }
{vogaisAcentos}         { imprimir("VOGAIS_ACENTOS : ", yytext()); return VOGAIS_ACENTOS; }
{aspasDuplas}           { imprimir("ASPAS DUPLAS : ", yytext()); return ASPAS_DUPLAS; }
.                       { imprimir("<<< CARACTER INVALIDO!!!>>> ", yytext()); return ERROR; }
<<EOF>>                 { return null; }


