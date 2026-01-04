import sys
import os

from PyQt6.QtWidgets import QApplication, QWidget
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtCore import QUrl, Qt
from PyQt6.QtGui import QColor

url = "https://doorman.abs.ac/chat/0x143Bc260678ea3fC80C44aFDC79530a02A9f3B70/widget?showTips=true&enableTipAnimations=true&fontSize=14&fontFamily=monospace&messageColor=%2300ff00&tipColor=%23ff00ff&backgroundColor=rgba(0%2C%200%2C%20430%2C%200.7)&maxMessages=40&animationSpeed=1200&messageSpacing=10&messagePadding=10&borderRadius=22&messageOpacity=95&showUserAvatar=true&showTipBadge=true&compactMode=false&messageWidth=100%25&textShadow=true&borderWidth=2"  
config_path = "config.txt"

if os.path.exists(config_path):
    with open(config_path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if line.startswith("chatUrl="):
                potential_url = line.split("=", 1)[1].strip()
                if potential_url:
                    url = potential_url
                    break

app = QApplication(sys.argv)

window = QWidget()
window.setWindowFlags(
    Qt.WindowType.FramelessWindowHint |
    Qt.WindowType.WindowStaysOnTopHint |
    Qt.WindowType.WindowTransparentForInput
)
window.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground, True)
window.setStyleSheet("background: transparent;")

width = 400
height = 600
screen = app.primaryScreen().availableGeometry()
padding = 20
window.resize(width, height)
window.move(screen.right() - width - padding, screen.bottom() - height - padding)

browser = QWebEngineView(window)
browser.resize(width, height)
browser.move(0, 0)

browser.load(QUrl(url))

browser.page().setBackgroundColor(QColor(Qt.GlobalColor.transparent))

def on_load_finished(success):
    if success:
        js_code = """
        (function() {
            document.documentElement.style.background = 'transparent';
            document.body.style.background = 'transparent';
            var style = document.createElement('style');
            style.innerHTML = `
                html, body, div, iframe, .container, .widget {
                    background: transparent !important;
                    background-color: transparent !important;
                }
            `;
            document.head.appendChild(style);
        })();
        """
        browser.page().runJavaScript(js_code)

browser.loadFinished.connect(on_load_finished)

window.show()

sys.exit(app.exec())