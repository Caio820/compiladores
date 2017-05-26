parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: TK_class ID ABRE_CHAVES FECHA_CHAVES EOF;

programa: CLASS PROGRAMA ABRE_CHAVES (declarar)* FECHA_CHAVES EOF;

declarar: campo_declara | metodo_declara;

campo_declara: campo(VIRGULA campo)*;

campo: TIPO ID PONTO_VIRGULA | TIPO ID ABRE_COLCHETE INT FECHA_COLCHETE PONTO_VIRGULA;

parametro: TIPO ID;

bloco: ABRE_CHAVES (campo_declara)* (estrutura)* FECHA_CHAVES;

metodo_declara: (TIPO | VOID) ID ABRE_PARENTESES (parametro(VIRGULA parametro)*)* FECHA_PARENTESES bloco;

estrutura: IF ABRE_PARENTESES expressao FECHA_PARENTESES bloco (ELSE bloco)?
         | WHILE ABRE_PARENTESES expressao FECHA_PARENTESES bloco
		 | FOR ABRE_PARENTESES ID IGUAL expressao PONTO_VIRGULA expressao PONTO_VIRGULA bloco FECHA_PARENTESES
		 | chama_metodo PONTO_VIRGULA
		 | RETURN expressao PONTO_VIRGULA
		 | CONTINUE PONTO_VIRGULA
		 | BREAK PONTO_VIRGULA
		 | localizacao ATRIBUICAO expressao PONTO_VIRGULA
		 | bloco;
		 
expressao: chama_metodo
         | localizacao
		 | literal
		 | expressao OP expressao
		 | SUBTRACAO expressao
		 | EXCLAMACAO expressao
		 | ABRE_PARENTESES expressao FECHA_PARENTESES;
		 
localizacao: ID | ID ABRE_COLCHETE expressao FECHA_COLCHETE;
		 
chama_metodo: ID ABRE_PARENTESES argumento* FECHA_PARENTESES;

argumento: expressao (VIRGULA expressao)*;

literal: INT | CHAR_LITERAL | BOOLEAN_LITERAL;
