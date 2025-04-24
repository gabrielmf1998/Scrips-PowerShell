#Esse ps1 chama outro script para execução
#É bom para em situações que precisamos integrar outros scripts ou chamar outro executável
$meusegundoscript = "C:\meusegundoscript.bat"
Write-Host "Instalando meusegundoscript..." -ForegroundColor Yellow
& $meusegundoscript
Write-Host "Execucao concluída!" -ForegroundColor Yellow