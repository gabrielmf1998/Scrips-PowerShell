#Diminui o volume no disco C: (Shrink) no tamanho que o usuário desejar
Write-Host "Criando segundo Disco..." -ForegroundColor Green
$gigasDesejados = Read-Host "Valor"
$espacoEmMB = [int]$gigasDesejados * 1024

#Renomea automaticamente o disco D: para outra letra, mesmo se estiver sendo usado.
$cmd = "select volume d`r`nassign letter=U"
$cmd | Out-File "$env:TEMP\dp.txt" -Encoding ASCII
diskpart /s "$env:TEMP\dp.txt"
Remove-Item "$env:TEMP\dp.txt"

#Diminui o volume informado no disco C para o disco D: novo, e formata em NTFS.
#Aonde está NOME_DO_DISCO, pode deixar como está ou renomar aqui pelo pelo script.
#Se necessário, pode criar variável $nome_do_disco e perguntar ao usuario qual será o novo nome.
$cmd = @"
select volume C
shrink desired=$espacoEmMB
create partition primary
assign letter=D
format fs=ntfs quick label=NOME_DO_DISCO
"@
$path = "$env:TEMP\dp.txt"
$cmd | Out-File $path -Encoding ASCII
diskpart /s $path
Remove-Item $path

#Caso implemente esse script junto com outros, é importante deixar essa sintaxe.
#As vezes powershell não respeita muito os processos, então coloquei esse White para aguardar até que esteja pronto o D:
while (-not (Test-Path "D:\")) {
    Start-Sleep -Seconds 1
}

Write-Host "Volume novo criado com sucesso! -ForegroundColor Green