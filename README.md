# Compiladores

Objetivo

Este trabalho tem como objetivo transformar uma linguagem de alto nível em uma linguagem de máquina e para que isso ocorra utilizaremos a ferramenta Antlr4 que converte gramáticas em programas que reconhecem sentenças na linguagem descrita pela gramática e como linguagem de alto nível utilizaremos Java.

Para a constução deste compilador teremos que passar por seis fases, a Analise Léxica, Analise Sintática, Análise semântica, Geração de código intermediario, Optimização de código e por fim a Geração de código final. Essas fases foram utilizadas como base para a construção deste compilador. 

Instalação

Aqui descrevemos as instruções básicas para a instalação do Antlr4 em Unix e Windows.

UNIX

0. Instalar Java (versão 1.6 ou superior) 

1. Download 

$ cd /usr/local/lib
$ curl -O http://www.antlr.org/download/antlr-4.5.3-complete.jar

Ou faça o download neste site: http://www.antlr.org/download.html e coloque ele em algum lugar seguro como: ‘/usr/local/lib’.

2. Adicione antlr-4.5.3-complete.jar em sua CLASSPATH:
$ export CLASSPATH=".:/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH"

3. Crie alias para a ferramenta ANTLR e TestRig.
$ alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
$ alias grun='java org.antlr.v4.gui.TestRig'

WINDOWS
0. Instalar Java (versão 1.6 ou superior) 

1. Download antlr-4.5.3-complete.jar (ou qualquer outra versão) do site http://www.antlr.org/download/ Salve em seu diretorio de bibliotecas java, chamado C:\Javalib 

2. Adicione antlr-4.5-complete.jar na CLASSPATH, ou: 
Permanentemente: usando a caixa de diálogo Propriedades do sistema > Variáveis de ambiente > Criar ou anexar à variável CLASSPATH

Temporariamente: digite na linha de comando:

SET CLASSPATH=.;C:\Javalib\antlr-4.5.3-complete.jar;%CLASSPATH%

3. Crie comandos curtos para a ferramenta ANTLR e TestRig, usando arquivos em lotes ou comandos doskey: 
Arquivos em lotes (no diretorio do sistema PATH) antlr4.bat e grun.bat 
java org.antlr.v4.Tool %*
java org.antlr.v4.gui.TestRig %*

Ou, use comandos doskey: 
doskey antlr4=java org.antlr.v4.Tool $*
doskey grun =java org.antlr.v4.gui.TestRig $*

Testando a Instalação

Execute o org.antlr.v4.Tool diretamente:
$ java org.antlr.v4.Tool
ANTLR Parser Generator Version 4.5.3
-o ___ specify output directory where all output is generated
-lib ___ specify location of .tokens files
...

ou use -jar:
$ java -jar /usr/local/lib/antlr-4.5.3-complete.jar
ANTLR Parser Generator Version 4.5.3
-o ___ specify output directory where all output is generated
-lib ___ specify location of .tokens files
...

Executando o Compilador

Passo 1 - Realizar o download do Repósitorio.

Passo 2 - Ir até o dirétorio, onde está o arquivo build.xml e as pastas do repositório utilizando o Terminal(Linux) ou o Prompt(Windows).

Passo 3 - Digite o comando ant (caso seja necessário, você deve baixar e instalar o pacote no site http://ant.apache.org/).

Passo 4 - Após a compilação do ant, você deve digitar o seguinte comando para testar o scanner(Análise Léxica):
java -jar dist/Compiler.jar -target scan -degub ../scanner/nomeEntrada  
                                 
Passo 4.1 - Após a compilação do ant, você deve digitar o seguinte comando para testar o parser(Análise Sintática):
java -jar dist/Compiler.jar -target parser -degub ../parser/nomeEntrada

P.S: Nos comandos acima, a parte de "nomeEntrada", deve ser substituída pelos arquivos de entrada das pastas de Scanner e Parser do Repositório.

Referências

Aho, A., Lam, M., Sethi, R., and Ullman, J. (2007).
Compiladores Principios Técnicas e Ferramentas.
Pearson, 2a. edition

The Definitive ANTLR4 reference. Disponível em:
http://www4.di.uminho.pt/~gepl/GQE/documents/books/Pragmatic.The.Definitive.ANTLR.4.Reference.Jan.2013.pdf

Blog do Eduardo Santos - www.eduardosan.com

