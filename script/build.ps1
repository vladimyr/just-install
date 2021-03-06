$HERE = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TOP_LEVEL = Split-Path -Parent $HERE

$env:JustInstallVersion = "2.4.0"

cd $TOP_LEVEL

#
# Clean
#

Remove-Item -ErrorAction SilentlyContinue -Force just-install.exe
Remove-Item -ErrorAction SilentlyContinue -Force just-install.msi
Remove-Item -ErrorAction SilentlyContinue -Force just-install.txt
Remove-Item -ErrorAction SilentlyContinue -Force just-install.wixobj
Remove-Item -ErrorAction SilentlyContinue -Force just-install.wixpdb

#
# Build
#

go build -o just-install.exe just-install.go

#
# Build MSI
#

candle just-install.wxs
light just-install.wixobj
