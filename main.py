#!/usr/bin/env python3
# -*- conding: utf-8 -*-

import os
import sys
from pathlib import Path

from PySide2.QtCore import QCoreApplication, Qt, QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


if __name__ == '__main__':
    os.putenv('QT_QPA_PLATFORM', 'linuxfb')
    QGuiApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    root = Path(__file__).parent
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    import_path = root / "imports"
    import_path = str(import_path.resolve())
    engine.addImportPath(import_path)
    qml_file = root / "main.qml"
    engine.load(QUrl.fromLocalFile(os.fspath(qml_file.resolve())))
    app.exec_()
