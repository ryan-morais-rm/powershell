# 📂 Projeto PowerShell Active Directory

Projeto para armazenar e distribuir arquivos PowerShell com dados do Active Directory.


## 📑 Descrição

- Criação de uma pasta `/Dados` dentro da VM onde ficarão os objetos dos usuários em formato `.csv`.
- Dentro da pasta `/Dados`, haverá subpastas separando por **anos** e **meses**.
- Os dados exportados conterão:
  - Nome
  - E-mail
  - Departamento
- No início de cada arquivo CSV, será salva a data em formato padronizado, por exemplo: Dados extraídos na data 25/05/2025


- A extração será feita por script PowerShell, chamando outros scripts auxiliares.


## ⚙️ Funcionamento

### 🎯 Objetivo

Criar um script `raiz.ps1` responsável por:

- Criar as pastas iniciais de anos e meses.
- Agendar uma tarefa para executar automaticamente em determinado horário.
- Verificar os arquivos já existentes dentro da pasta `/Dados` e salvar novos arquivos com nomes incrementais, por exemplo: dados-usuarios-1.csv, dados-usuarios-2.csv, dados-usuarios-3.csv


## 📝 Passo a Passo

1. **Agendar Execução Automática**
   - Acessar o **Gerenciamento de Tarefas do Windows**.
   - Agendar a execução diária do script `raiz.ps1`.

2. **Criar Script `pastas.ps1`**
   - Responsável por criar as pastas de anos e meses.

3. **Criar Script `parser.ps1`**
   - Responsável por chamar `Get-ADUser` e gerar os arquivos `.csv`.

4. **Executar `raiz.ps1`**
   - O script `raiz.ps1` executa:
     - O `pastas.bat` (uma única vez para criar estrutura).
     - O `parser.bat` de forma recorrente, gerando os arquivos de dados.

---

## 📌 Observações

- Certifique-se de que o usuário que executa a tarefa agendada possua permissões de leitura do Active Directory e gravação na pasta `/Dados`.
- Verifique a codificação do CSV para evitar problemas com caracteres especiais.
- Mantenha backup dos arquivos gerados.
