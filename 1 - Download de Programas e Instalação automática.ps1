#Faz o Download de qualquer programa desde que tenha um hotlink (direct-link)
#Neste exemplo, estamos baixando E instalando 7zip
#Você pode modificar apenas para fazer o download, é de preferencia do usuário
Write-Host "Baixando programa informado" -ForegroundColor Green

#Vai forçar utilização segura de TLS 1.2 para máquinas antigas
#Caso sua máquina seja acima do Windows Server 2016, ou powershell 5.1, não precisa desde comando!
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
#Cria o caminho correto para local raiz de execucao, isso evita erros caso o script seja convertido para ps2exe!
$ScriptPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$ScriptDir = Split-Path -Parent $ScriptPath

#Local de Download
$caminhoinstalador = "$env:TEMP\7zip.msi"

#URL Hotlink ou DirectLink
Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z2301-x64.msi" -OutFile $caminhoinstalador

#Inicia o processo baseado no caminho de download variável $caminhoinstalador
#Tambem faz a instalacao silenciosa caso seja .msi, se for exe, talvez seja necessário remover o /i e /quiet
Start-Process msiexec.exe -ArgumentList "/i `"$caminhoinstalador`" /quiet /norestart" -Wait
Write-Host "Programa $caminhoinstalador baixado e instalado com sucesso!" -ForegroundColor Green