@echo off



@set "cmderDir=%~dp0"

@set "ShellCtxDesc=Cmder Here"

IF %cmderDir:~-1%==\ SET cmderDir=%cmderDir:~0,-1%

@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set "CONEMU=ConEmu.exe"
) else (
    set "CONEMU=ConEmu64.exe"
)

set "list=HKCR\Directory\shell;HKCR\Directory\Background\shell;HKCR\Drive\shell"

setlocal enableextensions enabledelayedexpansion

@for %%r in ("%list:;=" "%") do (

	@reg add "%%~r\%ShellCtxDesc%" /f /ve /d "Cmder Here"
	@reg add "%%~r\%ShellCtxDesc%" /f /v Icon /d "%cmderDir%\icons\cmder.ico,0"
	
	@set "tExec=\"%cmderDir%\vendor\conemu-maximus5\%CONEMU%\""
	@set "tDir=/Dir \"%cmderDir%\""
	@set "tTitle=/Title Cmder"
	@set "tIcon=/Icon \"%cmderDir%\icons\cmder.ico\""
	@set "tCfg=/LoadCfgFile \"%cmderDir%\config\ConEmu.xml\""
	@set "tCommand=/cmd cmd /k \"%cmderDir%\vendor\init.bat\" \"-new_console:d:%%V\""
	
	@reg add "%%~r\%ShellCtxDesc%\command" /f /ve /d "!tExec! !tDir! !tTitle! !tIcon! !tCfg! !tCommand!"
)

endlocal
