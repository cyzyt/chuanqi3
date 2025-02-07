@echo off
echo 程序文件文件更新前，确保服务器已停止服务。更新目录“D:\Mirserver3”！
echo 默认更新到“D:\Mirserver3”，如果是其他盘，请使用鼠标右键，
echo 点击该文件，然后点编辑，修改里面的路径
pause
set WSDir=D:\MirServer3
Copy Mir200\M2Server.exe %WSDir%\Mir200\ /y
Copy Mir200\M2Server.map %WSDir%\Mir200\ /y
Copy Mir200\lua5.3.0.dll %WSDir%\Mir200\ /y
Copy Mir200\libtcmalloc.dll %WSDir%\Mir200\ /y
Copy Mir200\mimalloc.dll %WSDir%\Mir200\ /y
Copy Mir200\mimalloc-redirect.dll %WSDir%\Mir200\ /y
Copy Mir200\cjson.dll %WSDir%\Mir200\ /y
Copy DBServer\DBServer.exe %WSDir%\DBServer\ /y
Copy LoginGate\LoginGate.exe %WSDir%\LoginGate\ /y
Copy RunGate\RunGate.exe %WSDir%\RunGate\ /y
Copy RunGate\RunGate.dll %WSDir%\RunGate\ /y
Copy GameCenter.exe %WSDir%\ /y
echo 程序文件文件已更新完成. . .
pause