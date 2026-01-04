@echo off
setlocal EnableDelayedExpansion
echo Checking if Python is installed...
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Python is already installed!
    python --version
) else (
    echo Python is not installed.
    echo Opening Microsoft Store to install Python...
    python
    echo.
    echo Please install Python from the Microsoft Store, then close and reopen this command prompt.
    echo After that, run this script again.
    pause
    exit /b
)
set "VENV_NAME=ChatWidget"
set "VENV_PATH=%~dp0%VENV_NAME%"
echo.
echo Checking for virtual environment "%VENV_NAME%"...
if exist "%VENV_PATH%\Scripts\activate.bat" (
    echo Virtual environment "%VENV_NAME%" already exists.
) else (
    echo Creating virtual environment "%VENV_NAME%"...
    python -m venv "%VENV_NAME%"
    if errorlevel 1 (
        echo Failed to create virtual environment.
        pause
        exit /b 1
    )
    echo Virtual environment created successfully.
)
echo.
echo Activating virtual environment...
call "%VENV_PATH%\Scripts\activate.bat"
echo Virtual environment "%VENV_NAME%" is now active.
echo.
echo Checking and installing required dependencies (PyQt6 and PyQt6-WebEngine)...
pip install PyQt6 PyQt6-WebEngine
if errorlevel 1 (
    echo Failed to install required packages. Check your internet connection or try again.
    pause
    exit /b 1
)
echo.
echo ================================================
echo DEPENDENCIES INSTALLED SUCCESSFULLY!
echo ================================================
echo PyQt6 and PyQt6-WebEngine are now ready to use.
echo.
echo ================================================
echo SETUP COMPLETE!
echo ================================================
echo Starting the application (index.py)...
python index.py
if errorlevel 1 (
    echo.
    echo The application encountered an error and exited.
) else (
    echo.
    echo The application has finished running.
)
echo.
echo You can rerun the application with: python index.py
echo.
echo To deactivate the virtual environment later, type: deactivate
echo.
echo This window will remain open. Close it when you're done.
echo ================================================
:stay_open
pause >nul
goto stay_open