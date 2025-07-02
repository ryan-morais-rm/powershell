function Verificar-Pastas {
    $msgExistente = 'Script já foi executado!'
    $msgNaoExistente = 'Script não foi executado!'
    $base = 'Dados'
    $anos = @('2025', '2026')
    $meses = @('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro')

    if (Test-Path -Path $base) {
        Write-Output "A pasta $base existe!"
        Start-Sleep -Seconds 1
        Write-Output $msgExistente
        return 0
    }
    else {
        Write-Output "A pasta $base não existe!"
        Write-Output $msgNaoExistente
        # Como a pasta base não existe, automaticamente nenhuma subpasta existe
        # Então pode criar a estrutura se desejar, ou apenas reportar
        foreach ($ano in $anos) {
            Write-Output "Criando pasta: $base\$ano"
            New-Item -ItemType Directory -Path "$base\$ano" -Force | Out-Null
            foreach ($mes in $meses) {
                Write-Output "Criando pasta: $base\$ano\$mes"
                New-Item -ItemType Directory -Path "$base\$ano\$mes" -Force | Out-Null
            }
        }
        return 1
    }
}

function Criar-Pastas {
	$base = 'Dados'
	$anos = @('2025', '2026')
        $meses = @('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro')

	New-Item -ItemType Directory -Path $base -Force

	for ($i = 0; $i -lt $anos.Count; $i++) {
		Write-Output "Criando o diretório $($anos[$i]) dentro da pasta $base!"
		New-Item -ItemType Directory -Path "$base\$($anos[$i])" -Force
		Start-Sleep -Seconds 1
		for ($j = 0; $j -lt $meses.Count; $j++) {
			Write-Output "Criando o diretório $($meses[$j]) dentro de $($anos[$i])"
			New-Item -ItemType Directory -Path "$base\$($anos[$i])\$($meses[$j])" -Force
			Start-Sleep -Seconds 1
			}
	}
}

Verificar-Pastas
