macOS Setup Instructions
========================

Before running the application on macOS, you need to make the run.sh script executable.

Step 1: Open Terminal
----------------------
- Press Command + Space to open Spotlight
- Type "Terminal" and press Enter

Step 2: Navigate to the project directory
------------------------------------------
cd /Downloads/chatOverlay-main

Step 3: Make the script executable
-----------------------------------
chmod +x run.sh

Step 4: Run the application
---------------------------
./run.sh

Alternatively, you can do this in one command from the project directory:
chmod +x run.sh && ./run.sh

The script will:
- Check if Python is installed
- Create a virtual environment (if needed)
- Install required dependencies (PyQt6 and PyQt6-WebEngine)
- Launch the application

Note: If you move this folder to a different location, update the path in Step 2 accordingly.
