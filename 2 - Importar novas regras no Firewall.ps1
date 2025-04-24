#Importa novas regras no Firewall da máquina Windows
#Isso é muito útil para configuração massiva de máquinas Windows em grandes empresas
Write-Host "Importando novas políticas no Firewall" -ForegroundColor Green
$caminhodoarquivofirewall = "CAMINHO\DO\ARQUIVO\regras.wfw"
netsh advfirewall import "$caminhodoarquivofirewall"
Write-Host "Regras Importadas com sucesso!" -ForegroundColor Green