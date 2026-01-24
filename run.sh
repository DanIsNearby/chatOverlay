#!/bin/bash

echo "Checking if Python is installed..."
if command -v python3 &> /dev/null; then
    echo "Python is already installed!"
    python3 --version
else
    echo "Python is not installed."
    echo "Please install Python from https://www.python.org/downloads/"
    echo "Or install via Homebrew: brew install python3"
    echo "After installation, run this script again."
    exit 1
fi

VENV_NAME="ChatWidget"
VENV_PATH="$(dirname "$0")/$VENV_NAME"

echo ""
echo "Checking for virtual environment \"$VENV_NAME\"..."
if [ -f "$VENV_PATH/bin/activate" ]; then
    echo "Virtual environment \"$VENV_NAME\" already exists."
else
    echo "Creating virtual environment \"$VENV_NAME\"..."
    python3 -m venv "$VENV_NAME"
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment."
        exit 1
    fi
    echo "Virtual environment created successfully."
fi

echo ""
echo "Activating virtual environment..."
source "$VENV_PATH/bin/activate"
echo "Virtual environment \"$VENV_NAME\" is now active."

echo ""
echo "Checking and installing required dependencies (PyQt6 and PyQt6-WebEngine)..."
pip install PyQt6 PyQt6-WebEngine
if [ $? -ne 0 ]; then
    echo "Failed to install required packages. Check your internet connection or try again."
    exit 1
fi

echo ""
echo "================================================"
echo "DEPENDENCIES INSTALLED SUCCESSFULLY!"
echo "================================================"
echo "PyQt6 and PyQt6-WebEngine are now ready to use."
echo ""
echo "================================================"
echo "SETUP COMPLETE!"
echo "================================================"
echo "Starting the application (index.py)..."
python index.py

if [ $? -ne 0 ]; then
    echo ""
    echo "The application encountered an error and exited."
else
    echo ""
    echo "The application has finished running."
fi

echo ""
echo "You can rerun the application with: python index.py"
echo ""
echo "To deactivate the virtual environment later, type: deactivate"
echo "================================================"
