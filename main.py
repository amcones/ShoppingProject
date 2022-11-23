# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtWidgets import QApplication

from service.login_backend import LoginBackend
from service.main_content_backend import MainContentBackend
from service.update_item_backend import UpdateItemBackend

if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).resolve().parent / "main.qml"

    loginBackend = LoginBackend()
    mainContentBackend = MainContentBackend()
    updateItemBackend = UpdateItemBackend()
    engine.rootContext().setContextProperty("loginBackend", loginBackend)
    engine.rootContext().setContextProperty("mainContentBackend", mainContentBackend)
    engine.rootContext().setContextProperty("updateItemBackend", updateItemBackend)
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
