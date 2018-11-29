# LuaLibMaker
A simple batch file to compile Lua libraries (lib, dll) from source under Windows. Essential for linking against on Windows for Lua-based software like ShiVa. Based on https://lua64bit.wordpress.com/2016/07/03/selfmade-lua/

## Usage
Run this batch file in the "VS Native Tools Command Prompt", and NOT the "standard" CMD. Supply the folder of the Lua SRC you want to compile as 1st argument, for example:
```C:\Tools\LuaLibMaker.bat Z:\Downloads\luasrc```

Your compiled files will appear in the "bin "subfolder. Run different versions of the Command Prompt to get different architectures (x86, x64, etc.)

You can use the 2nd parameter to rename the output dir: like "32" to save to "lib32", or "64" to write to "lib64" instead of just "lib". Example: 
```C:\Tools\LuaLibMaker.bat Z:\Downloads\luasrc 32```
