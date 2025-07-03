Import-Module ActiveDirectory
# Adição do PowerView.ps1 para teste do AD

$base = "Dados"
$mes = Get-Date -UFormat %B
$ano = Get-Date -UFormat %Y
$pasta_arquivo = "$base\$ano\$mes"
$qtd_arq = (Get-ChildItem -Path $pasta_arquivo -File).Count + 1
$Mensagem_Cabecalho = "Dados extraídos em: $(Get-Date), no formato americano!"

$nome_arq = "dados_usuarios$qtd_arq.csv"
$arquivo = "$pasta_arquivo\$nome_arq"

# Cria o arquivo e escreve a mensagem de cabeçalho
Set-Content -Path $arquivo -Value $Mensagem_Cabecalho
Add-Content -Path $arquivo -Value ""  # linha em branco

# Inicia o script de Get-ADUser
$campos = @("Name", "Department", "Mail")
$dados = Get-ADUser -Filter * -Properties $campos | Select-Object -Property $campos

# Exporta os dados como CSV sem sobrescrever o cabeçalho
$dados | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Add-Content -Path $arquivo -Encoding UTF8
