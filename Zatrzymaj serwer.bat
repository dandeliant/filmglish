@echo off
chcp 65001 >nul
title Filmglish - zatrzymywanie
echo Zatrzymuje serwer Filmglish (port 8000)...
powershell -NoProfile -Command "$p = Get-NetTCPConnection -LocalPort 8000 -State Listen -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique; if ($p) { $p | ForEach-Object { Stop-Process -Id $_ -Force -ErrorAction SilentlyContinue }; 'Serwer zatrzymany.' } else { 'Serwer nie byl uruchomiony.' }"
echo.
timeout /t 2 /nobreak >nul
exit
