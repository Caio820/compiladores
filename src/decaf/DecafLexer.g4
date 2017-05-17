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

IDENTIFICADORES:'class'|'boolean'|'break'|'callout'|'continue'|'else'|'for'|'int'|'return'|'void'|'if';

ABRE_CHAVES : '{';
FECHA_CHAVES : '}';

ABRE_PARENTESE : '(';
FECHA_PARENTESE : ')';

ABRE_COLCHETE : '[';
FECHA_COLCHETE : ']';

PONTOS: ',' | '.' | ';' | ':';

INT: DIGITO+ | HEXA;

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

OPERADORES: '+' | '-' | '*' | '/' | '%' | '=';
COMPARADORES: '<' | '>' | '<=' | '>=' | '==' | '!=';
CONDICIONADORES: '&&' | '||';

WS_ : [ \n\t\r]+ -> skip;
COMENTARIO : '//' (~'\n')* '\n' -> skip;

fragment
ESC : '\\' [btnrf"'\\];
