parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class ID ABRE_CHAVES FECHA_CHAVES EOF;
