$ErrorActionPreference = "Stop"

$CURL = "C:\tools\curl.exe"
$projeto = "dyfar"

Write-Host "Compactando executavel"

# Executa EXE
& ".\$projeto.exe" -v

# Remove zip antigo
if (Test-Path "$projeto.zip") {
    Remove-Item "$projeto.zip"
}

# Compacta (NATIVO do Windows)
Compress-Archive -Path "$projeto.exe" -DestinationPath "$projeto.zip"

# Lê versão do XML (CORRETO, sem gambiarra)
[xml]$xml = Get-Content "versao.xml"
$versao = $xml.SelectSingleNode("//versao").InnerText

Write-Host "Versao: $versao"
Write-Host "Enviando arquivos..."

# Upload http://www.walg.com.br/clientes/dyfar/
& $CURL -p --insecure "ftp://ftp.walg.com.br/clientes/$projeto/" --user "walg:w@g1165" -T "$projeto.zip" --ftp-create-dirs
& $CURL -p --insecure "ftp://ftp.walg.com.br/clientes/$projeto/" --user "walg:w@g1165" -T "versao.xml" --ftp-create-dirs

Start-Sleep -Seconds 5