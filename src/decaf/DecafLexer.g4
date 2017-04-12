lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

PROGRAMA : 'class' 'Program' ABRE_CHAVES CAMPO* METODO* FECHA_CHAVES;



ABRE_CHAVES : '{';
FECHA_CHAVES : '}';

ID : LETRA (LETRA | DIGITO )*;

LETRA  : ('a'..'z' | 'A'..'Z')+;

DIGITO : ('0'..'9')+;

INT: DIGITO+;

HEXA: '0x' [0-9a-fA-F]+;

WS_ : (' ' | '\n' ) -> skip;

COMENTARIO : '//' (~'\n')* '\n' -> skip;

//CHAR : '\'' (ESC|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

CHAR_LITERAL: '\'' (ESC|~'\'') '\'';

//STRING_LITERAL : "CHAR";

fragment
ESC :  '\\' ('n'|'"');
