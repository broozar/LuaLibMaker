@echo off

REM - Lua Library Maker for Windows
REM - Felix Caffier
REM - November 2018
REM - Based on https://lua64bit.wordpress.com/2016/07/03/selfmade-lua/

REM - Usage info: Run this batch file in the "VS Native Tools Command Prompt", and NOT the "standard" CMD.
REM - Supply the folder of the Lua SRC you want to compile as 1st argument
REM - Example: C:\Tools\LuaLibMaker.bat Z:\Downloads\luasrc

REM - Your compiled files will appear in the "bin "subfolder.
REM - Run different versions of the Command Prompt to get different architectures (x86, x64, etc.)

REM - You can use the 2nd parameter to rename the output dir: like "32" to save to "lib32", or "64" to write to "lib64" instead of just "lib"
REM - Example: C:\Tools\LuaLibMaker.bat Z:\Downloads\luasrc 32

:CHECKS
if [%1]==[] (
	echo ERROR: You must supply a Lua Source directory as 1st parameter.
	exit /b
	)

:CHANGEDIR
cd /d %1

:COMPILE
cl /MD /O2 /c /DLUA_BUILD_AS_DLL *.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:lua.lib /OUT:lua.dll *.obj
lib /OUT:lua-static.lib *.obj

:MOVE
set ldir=bin%2
mkdir %ldir%
move lua.lib %ldir%\lua.lib
move lua-static.lib %ldir%\lua-static.lib
move lua.dll %ldir%\lua.dll

:CLEANUP
del *.o /f /q
del *.obj /f /q
del *.exp /f /q
