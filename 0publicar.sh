#!/bin/bash
CURL="curl.exe"
ZIP="zip.exe"
STRIP="/c/lazarus/fpc/3.2.2/bin/x86_64-win64/strip.exe"

echo "Compactando executavel"
projeto="dyfar"

./$projeto.exe -v
rm $projeto.zip
$ZIP $projeto.zip $projeto.exe

echo Conectando para transferir
echo Transferindo para $projeto

#scp $projeto.zip $projeto@$projeto.dynv6.net:/tmp/$projeto.zip
$CURL -p --insecure  "ftp://walg.com.br/clientes/$projeto/" --user "walg:w@g1165" -T $projeto.zip --ftp-create-dirs
$CURL -p --insecure  "ftp://walg.com.br/clientes/$projeto/" --user "walg:w@g1165" -T "versao.xml" --ftp-create-dirs

