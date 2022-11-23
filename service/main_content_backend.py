# This Python file uses the following encoding: utf-8
from PySide6 import QtCore
from PySide6.QtCore import QObject, Signal, Slot

from dao.select_items import select_items, select_all_items


class MainContentBackend(QtCore.QObject):
    def __init__(self):
        QObject.__init__(self)

    selectSuccess = Signal(int, str, int, float, str, str)

    @Slot(str)
    def searchItems(self, itemInfo):
        result = select_items(itemInfo)
        for item in result:
            self.selectSuccess.emit(item[0], item[1], item[2], item[3], item[4], item[5])

    @Slot()
    def selectAllItems(self):
        result = select_all_items()
        for item in result:
            self.selectSuccess.emit(item[0], item[1], item[2], item[3], item[4], item[5])