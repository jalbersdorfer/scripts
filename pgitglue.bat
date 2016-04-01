@echo off

rem /***********************************************************************
rem  * gitglue Script by juergen.albersdorfer@speed4trade.com 
rem  *    - To glue together your git Repositories
rem  * 
rem  * To execute commands inside all git repositories found
rem  * within the current directory, recursivly, in parallel.
rem  * 
rem  * Example:
rem  *    C:\foo\bar\gitglue.bat git pull
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
		start /b %~1 > nul 2>&1
	) else (
		start /b %* > nul 2>&1
	)
	goto eof
)
for /f %%i in ('dir /ad /s /b .git') do (
	echo.
	cd /d %%i\..
	cd
	if not x%str1:&=%==x%str1% (
		start /b %~1 > nul 2>&1
	) else (
		start /b %* > nul 2>&1
	)
)
endlocal

:eof
cd /d %INITIAL_DIR%
