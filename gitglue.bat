@echo off

rem /***********************************************************************
rem  * gitglue Script by JA@S4T.BIZ 
rem  *    - To glue together your git Repositories
rem  * 
rem  * To execute commands inside all git repositories found
rem  * within the current directory, recursivly.
rem  * 
rem  * Example:
rem  *    E:\Speed4Trade_V3\Server\gitglue.bat git pull
rem  * 
rem  * !!! Attention !!!
rem  *    WITH GREAT POWER COMES GREAT RESPONSIBILITY!
rem  *
rem  **********************************************************************/

SET INITIAL_DIR=%cd%

@setlocal enableextensions enabledelayedexpansion
set str1=%1

if exist .git (
	if not x%str1:&=%==x%str1% (
		%~1
	) else (
		%*
	)
	goto eof
)
for /f %%i in ('dir /ad /s /b .git') do (
	echo.
	cd /d %%i\..
	cd
	if not x%str1:&=%==x%str1% (
		%~1
	) else (
		%*
	)
)
endlocal

:eof
cd /d %INITIAL_DIR%
