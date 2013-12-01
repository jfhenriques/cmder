:: Init Script for cmd.exe
:: Sets some nice defaults
:: Created as part of cmder project

:: Setting prompt style
@for /f "tokens=2 delims=:." %%x in ('chcp') do @set cp=%%x
:: The slow part
:: World without Unicode is a sad world
@chcp 65001>nul
:: It has to be lambda, I already made a logo
@prompt $E[1;32;40m$P$S{git}$S$_$E[1;30;40mλ$S$E[0m
@chcp %cp%>nul


:: Pick right version of clink
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set architecture=86
) else (
    set architecture=64
)

@set rootDir=%~dp0..
@set clinkDir=%USERPROFILE%\AppData\Local\clink

@if not exist "%clinkDir%\git.lua" (
	::@echo f | @xcopy /Y /Q "%rootDir%\config\git.lua" "%clinkDir%\git.lua" > NUL
	copy /Y "%rootDir%\config\git.lua" "%clinkDir%\git.lua" > NUL
)


:: Run clink
@%rootDir%\vendor\clink\clink_x%architecture%.exe inject --quiet --profile %rootDir%\config

:: Prepare for msysgit

:: I do not even know, copypasted from their .bat
@set PLINK_PROTOCOL=ssh
@if not defined TERM set TERM=msys

:: Enhance Path
@set git_install_root=%rootDir%\vendor\msysgit
@set PATH=%PATH%;%rootDir%\bin;%git_install_root%\bin;%git_install_root%\mingw\bin;%git_install_root%\cmd;%git_install_root%\share\vim\vim73;

:: Add aliases
@if not exist "%USERPROFILE%\cmder.aliases" (
	@cat "%rootDir%\config\aliases" > "%USERPROFILE%\cmder.aliases"
)

@doskey /macrofile="%rootDir%\config\aliases"

:: Set home path
@set HOME=%USERPROFILE%
@echo Welcome to cmder!
