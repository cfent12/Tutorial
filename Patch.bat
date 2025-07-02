@echo off
set SOURCE=패치 파일 위치
set DESTINATION=패치 파일을 넣을 위치
set TEMP=%DESTINATION%\Temp

if not exist "%DESTINATION%\\" (
    echo 대상 디렉토리가 없습니다. -^> %DESTINATION%
	echo 파일 복사를 중단합니다.
	echo.
	echo *****해당 내용을 IT담당자에게 문의해주세요.*****
	echo.
    pause
	exit /b
)

if not exist "%TEMP%\\" (
    mkdir "%TEMP%"
)

echo 임시저장 파일을 복사 중입니다...
xcopy "%SOURCE%\*" "%TEMP%\" /E /H /C /Y /F
if errorlevel 1 (
	echo.
    echo *****"%SOURCE%" 위치에 접근할 수 없습니다.*****
	echo.
	pause
	exit /b
) else (
    echo 임시저장 파일 복사가 완료되었습니다.
)

for /r "%TEMP%" %%f in (*.*) do (
    powershell -NoProfile -Command "try { Unblock-File -LiteralPath '%%f' } catch {}"
)
echo 임시저장 파일 차단 해제가 완료되었습니다.

echo 파일을 복사 중입니다...
robocopy "%TEMP%" "%DESTINATION%" /MOVE /E /COPYALL /IS /IT /R:1 /W:1 /NFL /NDL >nul
echo.
if %ERRORLEVEL% GEQ 8 (
	for /d %%D in ("%TEMP%\*") do (
		rd /s /q "%%D"
	)
	
    if %ERRORLEVEL% GEQ 16 (
		echo *****관리자 권한으로 실행해 주세요.*****
	) else (
		echo *****프로그램 종료 후 실행해 주세요.*****
	)
) else (
    echo *****패치가 완료되었습니다.*****
)

echo.
pause
