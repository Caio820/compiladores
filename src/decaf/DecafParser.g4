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

estrutura:         localizacao (IGUAL|ATRIBUICAO) expressao PONTO_VIRGULA
                 | IF ABRE_PARENTESES expressao FECHA_PARENTESES bloco (ELSE bloco)?
		 | FOR ID IGUAL expressao VIRGULA expressao bloco
		 | chama_metodo PONTO_VIRGULA
		 | RETURN expressao PONTO_VIRGULA
		 | CONTINUE PONTO_VIRGULA
		 | BREAK PONTO_VIRGULA
		 | bloco;
		 
expressao:         localizacao
                 | chama_metodo
		 | literal
		 | expressao (OP|SUBTRACAO) expressao
		 | SUBTRACAO expressao
		 | EXCLAMACAO expressao
		 | ABRE_PARENTESES expressao FECHA_PARENTESES;
		 
localizacao: ID | ID ABRE_COLCHETE expressao FECHA_COLCHETE;
		 
chama_metodo: ID ABRE_PARENTESES argumento* FECHA_PARENTESES | CALLOUT ABRE_PARENTESES STRING_LITERAL (VIRGULA elemento_callout)* FECHA_PARENTESES;

argumento: expressao (VIRGULA expressao)*;

elemento_callout: STRING_LITERAL | expressao;

literal: INT | CHAR_LITERAL | BOOLEAN_LITERAL;
