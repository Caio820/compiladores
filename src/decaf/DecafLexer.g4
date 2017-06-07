lexer grammar DecafLexer;

@header {
  package decaf;
}

options {
  language=Java;
}

tokens {
  TK_class
}

CLASS: 'class';
PROGRAMA: 'Program';
BREAK: 'break';
CALLOUT: 'callout';
CONTINUE: 'continue';
DO: 'do';
FOR: 'for';
WHILE: 'while';
IF: 'if';
ELSE: 'else';
RETURN: 'return';
VOID: 'void';
TIPO: 'int' | 'boolean';

INT: DIGITO+ | HEXA | SUBTRACAO DIGITO+;

BOOLEAN_LITERAL: 'true' | 'false';

HEXA: '0x'[0-9a-fA-F]+;

CHAR_LITERAL:  '\'' CHAR '\'' | '\'' ESC+ '\'';

STRING_LITERAL: '\"' STRING_CARS? '\"';

ID: LETRA (LETRA | DIGITO)*;

LETRA : 'a'..'z' | 'A'..'Z' | '_';

DIGITO: '0'..'9';

fragment
STRING_CARS: STRING_CAR+;

fragment
STRING_CAR: CHAR | ESC;

fragment
CHAR: ~['"\\];
ABRE_CHAVES : '{';
FECHA_CHAVES : '}';
ABRE_PARENTESES : '(';
FECHA_PARENTESES : ')';
ABRE_COLCHETE : '[';
FECHA_COLCHETE : ']';
VIRGULA: ',';
PONTO_VIRGULA: ';';
PONTO:'.';
DOIS_PONTOS: ':';
EXCLAMACAO: '!';
OP: '+' | '*' | '/' | '%' | '<' | '>' | '>=' | '<=' | '!=' | '==' | '&&' | '||';
ATRIBUICAO: '+=' | '-=' | '*=' | '/=';
SUBTRACAO: '-';
IGUAL: '=';
AND: '&&';
OR: '||';
WS_ : [ \n\t\r]+ -> skip;
COMENTARIO : '//' (~'\n')* '\n' -> skip;

fragment
ESC : '\\' [btnrf"'\\];
