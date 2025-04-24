#Muito útil para instalação massiva de programas, sendo a maioria podendo ser de forma silenciosa

#Pode ser implementado com "1 - Download de Programas" para automatizar mais ainda e ficar super eficiente

#Vai instalar o Winrar versão 700
Write-Host "Instalando Winrar..." -ForegroundColor Green
$ScriptPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$ScriptDir = [System.IO.Path]::GetDirectoryName($ScriptPath)
$instaladorwinrar = Join-Path $ScriptDir "C:\Porgramas\Downloads\winrar-x64-700br.exe"
Start-Process -FilePath $instaladorwinrar -ArgumentList "/S" -Wait
Write-Host "Instalado Winrar com sucesso!!" -ForegroundColor Green


#Vai instalar Java JDK Java
Write-Host "Instalando JDK..." -ForegroundColor Green
$ScriptPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$ScriptDir = [System.IO.Path]::GetDirectoryName($ScriptPath)
$installerjdk = Join-Path $ScriptDir "C:\Porgramas\Downloads\jdk-8u201-windows-x64.exe"
Start-Process -FilePath $installerjdk -ArgumentList "/s" -Verb RunAs -Wait
Write-Host "Instalado Java com sucesso!!" -ForegroundColor Green