## POWERSHELL

1. Projeto para armazenar e distribuir os arquivos poweshell do Active Directory

Criação de uma pasta “/Dados” dentro da VM onde vai conter objetos dos usuários em formato .csv.
Dentro da pasta “/Dados” vão ter sub-pastas, separando por anos e meses, respectivamente.  
Separar dados como: nome, e-mail, departamento…
Salvar no começo do arquivo de modo padronizado a data, por exemplo: “Dados extraídos na data 25/05/2025”
Fazer isso via script powershell, chamando outros scripts.
-> Criar um script raiz.ps1. Dentro do script vai ter uma tarefa agendada, colocando
     ele para ser executado em X hora. Depois, esse script vai verificar dentro da
     pasta “/Dados”, os nomes de arquivos já existentes, por exemplo:
     “dados_usuarios_1.csv”. Então, salvar o novo arquivo extraído como
     “dados_usuarios_2.csv”... 
A princípio, vamos utilizar o comando principal “get-ADuser” com seus parâmetros. 

Estruturação dos arquivos:

./raiz.ps1  ./parser.bat  ./pastas.bat 
    I->   /Dados
              l->  /2025 / 2026 … 
                        l->  /julho /agosto /setembro …
                                 l-> dados_usuarios_X.csv … 

Passo a passo:
Ir no gerenciamento de windows e agendar para que o script seja programado diariamente. 
Criar o script pastas.bat que vai criar as pastas de anos e meses.  
Criar o script parser.bat que vai ser o portador do “get-ADuser”. 
Chamar todos esses scripts dentro do ./raiz.ps1, que executará o pastas.bat uma única vez e o parser.ps1 constantemente.
