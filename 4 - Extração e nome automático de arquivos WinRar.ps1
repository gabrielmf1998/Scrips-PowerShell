#Extrai arquivos previamente informados com o nome correto que deseja
#Isso é bom para automaticação e instalação massiva de programas

Write-Host "Extraindo arquivos informado..." -ForegroundColor Green
$zipPath = "C:\Caminho_do_rar\java.rar"

#Caminho do Winrar, normalmente está em c:, caso seja x86, alterar para C:\Program Files x86\Winrar
$winRAR = "C:\Program Files\WinRAR\Rar.exe"

#Destino para aonde o arquivo será extraido
$destUnm = "D:\"

#Faz a execução e extração.
& "$winRAR" x -o+ "$zipPath" "$destUnm\"

#Aqui é onde podemos automatizar e deixar renomeado os arquivos que extraimos.
#É para situações onde o arquivo.rar está com nome errado, ou precisamos extrair mais de uma vez o mesmo arquivo com nomes diferentes

#Nome do arquivo que foi extraido
$origem = "C:\Meu_arquivo"

#Novo nome que será dado ao arquivo/pasta
$novoNome = "C:\Meu_arquivo_novo_nome"
$diretorioPai = Split-Path $origem
$novoCaminho = Join-Path $diretorioPai $novoNome
Rename-Item -Path $origem -NewName $novoNome

#Caso precise extrair uma segunda vez o mesmo arquivo, só que queria outro nome, ou mais vezes, assim por diante...
& "$winRAR" x -o+ "$zipPath" "$destUnm\"
$origem = "C:\Meu_arquivo"
$novoNome = "C:\Meu_arquivo_outro_nome_denovo"
$diretorioPai = Split-Path $origem
$novoCaminho = Join-Path $diretorioPai $novoNome
Rename-Item -Path $origem -NewName $novoNome
Write-Host "Extração concluída com sucesso!" -ForegroundColor Green