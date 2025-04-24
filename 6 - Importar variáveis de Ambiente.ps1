#Importa as variáveis de ambiente informadas aqui.
Write-Host "Adicionando variáveis de ambiente no Windows..." -ForegroundColor Green

#Você deve informar aqui qual a variável de ambiente
#Pode também implementar para perguntar ao usuario qual variável deseja com $variável
$pathsToAdd = @(

#ou $variável
    "%JAVA_HOME%\bin",
)

#Esse comando armazena no $existingPath aonde essa variável deve ser importada
#Neste meu caso, estou utilizando o Path padrão do windows, mas você pode utilizar outras como Path, TEMP, Windir etc...
$existingPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

foreach ($path in $pathsToAdd) {
    if (-not ($existingPath -split ";" | ForEach-Object { $_.Trim() } | Where-Object { $_ -eq $path })) {
        $existingPath += ";$path"
    }
}

#Vai dar um GET-EnvironmentVariable para mostrar para o usuário que deu certo!
[Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)