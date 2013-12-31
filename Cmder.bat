@echo off
SET CMDER_ROOT=%~dp0

start %CMDER_ROOT%vendor\conemu-maximus5\ConEmu64.exe /Icon "%CMDER_ROOT%icons\cmder.ico" /Title Cmder /LoadCfgFile "%CMDER_ROOT%config\ConEmu.xml" /cmd cmd /k "%CMDER_ROOT%vendor\init.bat" "-new_console:d:%USERPROFILE%"
