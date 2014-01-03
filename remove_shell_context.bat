@echo off

@set "ShellCtxDesc=Cmder Here"

set "list=HKCR\Directory\shell;HKCR\Directory\Background\shell;HKCR\Drive\shell"

@for %%r in ("%list:;=" "%") do (

	reg delete "%%~r\%ShellCtxDesc%"
	
)
