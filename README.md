A simple, transparent, always-on-top desktop widget that displays a customizable chat interface in a frameless window. Perfect for streaming overlays, live chat on your desktop, or any other use!

| ![The chat widget overlay in action – positioned in the bottom-right corner with transparent background](https://github.com/user-attachments/assets/358eaaef-40f8-4f0c-a775-88a5c92d5ea0) | ![Example of a loaded web chat (e.g., Telegram, Discord, Twitch, etc.) inside the transparent overlay window](https://github.com/user-attachments/assets/72388436-08d0-453a-b375-a200019e292f) |
|:---:|:---:|

This app loads a web-based chat widget directly into a transparent window positioned in the bottom-right corner of your screen that will follow you to all the apps that you open.

Features
--------
- Frameless and fully transparent window (you can click through it)
- Always stays on top of other windows
- Loads any chat widget URL you want (easy to customize)
- One-click launch with start.bat
- Automatically handles Python and all required packages

How to Use
----------

1. First Time Setup & Launch
   Edit config.txt to add your link 
   
   Simply double-click the file:

   start.bat

   That's all you need to do!

   The script will automatically:
   - Check if Python is installed (if not, it opens the Microsoft Store for you)
   - Create a virtual environment (a safe isolated folder for this app)
   - Install the two required packages: PyQt6 and PyQt6-WebEngine
   - Launch the chat widget

   After the first run, starting the app again will be very fast.

2. Running the App Again

   Just double-click start.bat whenever you want to open the widget.

3. Closing the App

   To close the chat widget:
   - Simply close the black terminal/command prompt window that opened
   - Or press Ctrl + C in that window and then close it

   The widget will disappear right away.

Is This Code Safe?
-----------------

Yes, it is completely safe! Here's how you can quickly verify it yourself using Grok (by xAI):

1. Go to https://grok.x.ai (or use Grok in the X/Twitter app)
2. Copy and paste the full content of these two files:
   - index.py (the Python code)
   - start.bat (the batch script)
3. Ask Grok something like:

   "Please review this Python and batch script code. Does it do anything malicious like stealing data, connecting to suspicious servers, or running hidden commands? Tell me exactly what it does."

Grok will analyze the code and confirm that:
- It only installs official, trusted Python packages from PyPI
- It only opens a local transparent window showing a webpage (the chat URL)
- It does NOT send any of your data anywhere
- It does NOT access your files, microphone, camera, or personal information
- Everything runs 100% locally on your computer

This kind of tool is commonly used by streamers and content creators.

Files in This Folder
-------------------

- index.py        → The main application (creates the widget window)
- start.bat       → The easy launcher and setup script (double-click this!)
- config.txt      → Contains your chat url
- ChatWidget/     → (Created automatically) Virtual environment folder - safe to ignore

Requirements
------------
- Windows (tested on Windows 10 and 11)
- Internet connection only for the first run 
