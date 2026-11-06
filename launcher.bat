@echo off
title Floppy disk check 
color 0a

:CHECK
echo Checking for floppy with right .txt file...

rem -- FLOPPY CHECK --
if exist "A:\Doom1.txt" 2>nul goto RUN_GAME1
if exist "A:\Doom2.txt" 2>nul goto RUN_GAME2
if exist "A:\Doom2F.txt" 2>nul goto RUN_GAME3
if exist "A:\Heretic.txt" 2>nul goto RUN_GAME4
if exist "A:\Wolfenstein.txt" 2>nul goto RUN_GAME5
if exist "A:\F1_2000.txt" 2>nul goto RUN_GAME6
if exist "A:\cards.txt" 2>nul goto RUN_GAME7
if exist "A:\tetris.txt" 2>nul goto RUN_GAME8
if exist "A:\minesweeper.txt" 2>nul goto RUN_GAME9
if exist "A:\uklizeni.txt" 2>nul goto RUN_GAME10
if exist "A:\pinball.txt" 2>nul goto RUN_GAME11


ping -n 2 127.0.0.1 >nul
goto CHECK


rem %~dp0 = same dir
:RUN_GAME1
echo Running Doom 1...
cd /d "%~dp0Doom 1"
start "" /D "%~dp0Doom 1" zdoom.exe
set GAME_EXE=zdoom.exe
set FLOPPY_FILE=A:\Doom1.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME2
echo Running Doom 2...
cd /d "%~dp0Doom 2"
start "" /D "%~dp0Doom 2" zdoom.exe
set GAME_EXE=zdoom.exe
set FLOPPY_FILE=A:\Doom2.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME3
echo Running Doom 2 (French)...
cd /d "%~dp0Doom 2 (French)"
start "" /D "%~dp0Doom 2 (French)" zdoom.exe
set GAME_EXE=zdoom.exe
set FLOPPY_FILE=A:\Doom2F.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME4
echo Running Heretic...
cd /d "%~dp0Heretic"
start "" /D "%~dp0Heretic" zdoom.exe
set GAME_EXE=zdoom.exe
set FLOPPY_FILE=A:\Heretic.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME5
echo Running Wolfenstein 3D...
cd /d "%~dp0Wolfenstein3D"
start dosbox.exe -conf .\dosbox.conf -exit
set GAME_EXE=dosbox.exe
set FLOPPY_FILE=A:\Wolfenstein.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME6
echo Running F1 2000...
cd /d "%~dp0F12000"
start dosbox.exe -conf .\dosbox.conf -exit
set GAME_EXE=dosbox.exe
set FLOPPY_FILE=A:\F1_2000.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME7
echo Running 4 Queens Computer Casino...
cd /d "%~dp0cards"
start dosbox.exe -conf .\dosbox.conf -exit
set GAME_EXE=dosbox.exe
set FLOPPY_FILE=A:\cards.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME8
echo Running Tetris...
cd /d "%~dp0Tetris"
start dosbox.exe -conf .\dosbox.conf -exit
set GAME_EXE=dosbox.exe
set FLOPPY_FILE=A:\tetris.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME9
echo Running Minesweeper...
cd /d "%~dp0Minesweeper"
start dosbox.exe -conf .\dosbox.conf -exit
set GAME_EXE=dosbox.exe
set FLOPPY_FILE=A:\minesweeper.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME

:RUN_GAME10
echo Running Uklizeni...
cd /d "%~dp0Uklizeni"
start "" /D "%~dp0Uklizeni" "Uklizeni.exe"
set GAME_EXE=Uklizeni.EXE
set FLOPPY_FILE=A:\Uklizeni.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME


:RUN_GAME11
echo Running 3D Pinball...
cd /d "%~dp0Pinball"
start "" /D "%~dp0Pinball" Pinball.exe
set GAME_EXE=Pinball.exe
set FLOPPY_FILE=A:\pinball.txt
ping -n 3 127.0.0.1 >nul
goto MONITOR_GAME


rem ===================================================
rem MONITOR FLOPPY & PROCESS
rem ===================================================

:MONITOR_GAME
ping -n 2 127.0.0.1 >nul

if exist %FLOPPY_FILE% 2>nul (
    tasklist /FI "IMAGENAME eq %GAME_EXE%" 2>nul | find /I "%GAME_EXE%" >nul
    if errorlevel 1 goto CHECK
    goto MONITOR_GAME
)

echo Floppy removed, closing game
taskkill /F /T /IM %GAME_EXE% 2>nul
ping -n 2 127.0.0.1 >nul
goto CHECK