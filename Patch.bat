@echo off
set SOURCE=��ġ ���� ��ġ
set DESTINATION=��ġ ������ ���� ��ġ
set TEMP=��ġ ���� �ӽ� ���� ��ġ

if not exist "%DESTINATION%\\" (
    echo ��� ���丮�� �����ϴ�. -^> C:\NEW_VTS_TEST
	echo ���� ���縦 �ߴ��մϴ�.
	echo.
	echo *****�ش� ������ IT����ڿ��� �������ּ���.*****
	echo.
    pause
	exit /b
)

if not exist "%TEMP%\\" (
    mkdir "%TEMP%"
)

echo �ӽ����� ������ ���� ���Դϴ�...
xcopy "%SOURCE%\*" "%TEMP%\" /E /H /C /Y /F
if errorlevel 1 (
	echo.
    echo *****"%SOURCE%" ��ġ�� ������ �� �����ϴ�.*****
	echo.
	pause
	exit /b
) else (
    echo �ӽ����� ���� ���簡 �Ϸ�Ǿ����ϴ�.
)

for /r "%TEMP%" %%f in (*.*) do (
    powershell -NoProfile -Command "try { Unblock-File -LiteralPath '%%f' } catch {}"
)
echo �ӽ����� ���� ���� ������ �Ϸ�Ǿ����ϴ�.

echo ������ ���� ���Դϴ�...
robocopy "%TEMP%" "%DESTINATION%" /MOVE /E /COPYALL /IS /IT /R:1 /W:1 /NFL /NDL >nul
echo.
if %ERRORLEVEL% GEQ 8 (
	for /d %%D in ("%TEMP%\*") do (
		rd /s /q "%%D"
	)
	
    if %ERRORLEVEL% GEQ 16 (
		echo *****������ �������� ������ �ּ���.*****
	) else (
		echo *****TEST VTS ���� �� ������ �ּ���.*****
	)
) else (
    echo *****��ġ�� �Ϸ�Ǿ����ϴ�.*****
)

echo.
pause