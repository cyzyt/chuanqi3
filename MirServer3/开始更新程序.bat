@echo off
echo �����ļ��ļ�����ǰ��ȷ����������ֹͣ���񡣸���Ŀ¼��D:\Mirserver3����
echo Ĭ�ϸ��µ���D:\Mirserver3��������������̣���ʹ������Ҽ���
echo ������ļ���Ȼ���༭���޸������·��
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
echo �����ļ��ļ��Ѹ������. . .
pause