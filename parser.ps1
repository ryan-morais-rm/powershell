$Mensagem_Cabecalho = "Dados extraídos em: $(Get-Date), no formato americano!"
$base = "Dados"
$mes = Get-Date -UFormat %B
$ano = Get-Date -UFormat %Y
$pasta_arquivo = "$base\$ano\$mes"
$qtd_arq = (Get-ChildItem -Path $pasta_arquivo -File).Count

if ($qtd_arq -eq 0) {
    $qtd_arq = 1
}

$nome_arq = "dados_usuarios$qtd_arq.csv"
New-Item -Path "$pasta_arquivo\$nome_arq" -ItemType "file"
Add-Content -Path "$pasta_arquivo\$nome_arq" -Value $Mensagem_Cabecalho
Add-Content -Path "$pasta_arquivo\$nome_arq" -Value " "
