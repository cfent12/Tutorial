@echo off
chcp 65001 >nul

set TASK_NAME=등록할 작업명
set EXE_PATH=\"C:\실행할 프로그램.exe\"
set TIME_TO_RUN=11:30
set RUN_AS_USER=%COMPUTERNAME%\%USERNAME%


schtasks /Delete /TN "%TASK_NAME%" /F >nul 2>&1
schtasks /Create /TN "%TASK_NAME%" /TR "%EXE_PATH%" /SC DAILY /ST %TIME_TO_RUN% /RL HIGHEST /F
if %ERRORLEVEL% gtr 0 (
    echo.
    echo === 작업 등록 중 오류가 발생했습니다. 관리자 권한으로 실행되었는지 확인하세요. ===
    echo.
	pause
	exit /k
) else (
    echo 작업 "%TASK_NAME%" 가 매일 %TIME_TO_RUN%에 실행되도록 등록되었습니다.
)


schtasks /Change /TN "%TASK_NAME%" /ENABLE
if %ERRORLEVEL% gtr 0 (
	echo.
	echo === 작업 등록 중 오류가 발생했습니다. 관리자 권한으로 실행되었는지 확인하세요. ===
	echo.
	pause
	exit /k
) else (
	echo 작업 "%TASK_NAME%" 의 상태를 사용으로 변경했습니다.
)


echo.
echo === 작업 등록 완료 ===
echo.
pause