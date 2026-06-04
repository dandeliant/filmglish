@echo off
chcp 65001 >nul
title Filmglish
cd /d "%~dp0"

echo ============================================
echo    Filmglish (od Angielskiwnet)
echo    uruchamianie...
echo ============================================
echo.
echo  Otwieram gre w przegladarce: http://localhost:8000
echo  Serwer dziala w osobnym, malym oknie.
echo  Aby zakonczyc - zamknij tamto okno serwera.
echo.

rem Uruchom lokalny serwer w osobnym, zminimalizowanym oknie
start "Filmglish - SERWER (nie zamykaj podczas gry)" /min cmd /c "python -m http.server 8000 2>nul || py -m http.server 8000"

rem Poczekaj chwile, az serwer wstanie, i otworz przegladarke
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000"

rem Zamknij to okno startowe (serwer dziala dalej w swoim oknie)
exit
