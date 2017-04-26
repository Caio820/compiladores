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


IDENTIFICADORES:'class'|'boolean'|'break'|'callout'|'continue'|'else'|'for'|'int'|'return'|'void'|'if';
//PROGRAMA : 'class' 'Program' ABRE_CHAVES CAMPO* METODO* FECHA_CHAVES;


ABRE_CHAVES : '{';
FECHA_CHAVES : '}';

ABRE_PARENTESES : '(';
FECHA_PARENTESES : ')';

ABRE_COLCHETE : '[';
FECHA_COLCHETE : ']';
 
OPERADORES : '+' | '-' | '*' | '/' | '%' | '=' ;
COMPARADORES: '<' | '>' | '<=' | '>=' | '==' | '!=';
CONDICIONADORES: '&&' | '||';

BOOLEAN_LITERAL:  ('true'|'false' );

ID : LETRA(LETRA | DIGITO)*;

LETRA  : ('a'..'z' | 'A'..'Z' | '_')+;

DIGITO : ('0'..'9')+;

INT: DIGITO+;

HEXA: '0x' [0-9a-fA-F]+;

CHAR_LITERAL : '\'' (ESC|~'\'') '\'';
STRING_LITERAL : '"' (ESC|~'"')* '"';

WS_ : (' ' | '\n' ) -> skip;

COMENTARIO : '//' (~'\n')* '\n' -> skip;

fragment
ESC :  '\\' ('n'|'"');
