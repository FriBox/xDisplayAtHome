@echo off
@echo XingHe Studio xDisplay

rem ��������·��
set AppRoot=%~dp0
set path=%path%;s:\Development\Python\Python.x86.v2.7.10\;s:\Development\Python\Python.x86.v2.7.10\Lib\;s:\Development\Python\Python.XHLib\;%AppRoot%Other.libs\;
set PYTHONPATH=s:\Development\Python\Python.x86.v2.7.10\;s:\Development\Python\Python.x86.v2.7.10\Lib\;s:\Development\Python\Python.XHLib\;%AppRoot%Other.libs\;

set OutRootApp=Application

rem ����Ŀ¼
del /f/s/q %AppRoot%%OutRootApp%
rd /s/q %AppRoot%%OutRootApp%
del /f/s/q %AppRoot%Source.py\src\build
rd /s/q %AppRoot%Source.py\src\build
del /f/s/q %AppRoot%Source.py\src\dist
rd /s/q %AppRoot%Source.py\src\dist

rem ���� Flash������ �� webroot
cd %AppRoot%Source.flash\
call %AppRoot%Source.flash\UpdateClient.cmd

pause Ŀ¼�Լ�ɾ���ɹ������������ʼ�ؽ�Ӧ�ó���Ŀ¼

rem ����Ŀ¼
md %AppRoot%%OutRootApp%
md %AppRoot%%OutRootApp%\webroot
md %AppRoot%%OutRootApp%\video

rem ���� xDisplayAtHome
cd call %AppRoot%Source.py\src\
call %AppRoot%Source.py\src\xCompile_xDisplayAtHome.cmd
rem ���� xDisplayAtHome �� APP�ļ���
copy /y %AppRoot%Source.py\src\xDisplayAtHome.exe %AppRoot%%OutRootApp%\
rem ���� xGetxDid
call %AppRoot%Source.py\src\xCompile_xGetxDid.cmd
rem ���� xGetxDid �� APP�ļ���
copy /y %AppRoot%Source.py\src\xGetxDid.exe %AppRoot%%OutRootApp%\

rem pause ���������ʼ ������������ļ���APP�ļ���
rem ���� xDisplay ����ļ��� APP�ļ���
copy /y %AppRoot%Source.py\src\xDisplayAtHome.cnf %AppRoot%%OutRootApp%\
copy /y %AppRoot%Source.py\src\xDisplayAtHome.msg %AppRoot%%OutRootApp%\
copy /y %AppRoot%AppEnd.VBS %AppRoot%%OutRootApp%\StopAll.vbs
copy /y %AppRoot%Readme.txt %AppRoot%%OutRootApp%\Readme.txt

rem ���� ffmpeg �� APP�ļ���
copy /y %AppRoot%Other.libs\ffmpeg.UPX.exe %AppRoot%%OutRootApp%\xEncoder.exe

rem ���� ��Ȫ���� �� APP�ļ���
copy /y %AppRoot%Other.libs\TitleFont.ttf %AppRoot%%OutRootApp%\TitleFont.ttf

rem ���� Web �� APP�ļ���
xcopy /Y/S/C/F/H/R %AppRoot%Source.py\src\webroot %AppRoot%%OutRootApp%\webroot\

rem ���� RtmpClient
copy /y %AppRoot%RtmpClient.cmd %AppRoot%%OutRootApp%\xRtmpClient.cmd

rem ���� Demo
copy /y %AppRoot%Other.libs\Demo.Webm %AppRoot%%OutRootApp%\video\

rem 7Z
ECHO ��ʼ������7Z
pause ���������ʼ�ؽ�7Z
s:\Applications\Apps\7Zip\App\7-Zip\7z.exe a -t7z -sfx -mx9 "d:\xDisplayAtHome.v5.05.%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%.exe" "%AppRoot%%OutRootApp%\"
