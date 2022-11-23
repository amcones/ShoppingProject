# This Python file uses the following encoding: utf-8
from PySide6 import QtCore
from PySide6.QtCore import QObject, Signal, Slot

from dao.select_items import select_items, select_all_items
from dao.update_items import insert_items, update_items, delete_items
from util.img_conv import img_encoder


class UpdateItemBackend(QtCore.QObject):
    def __init__(self):
        QObject.__init__(self)

    insertResult = Signal(str, int, float, str, str)
    updateResult = Signal(str, int, float, str, str)

    @Slot(str, int, float, str, str)
    def insertItem(self, itemName, itemCount, itemPrice, itemInfo, itemImage):
        itemImage = img_encoder(itemImage[7:])
        insert_items(itemName, itemCount, itemPrice, itemInfo, itemImage)
        self.insertResult.emit(itemName, itemCount, itemPrice, itemInfo, itemImage)

    @Slot(int, str, int, float, str, str)
    def updateItem(self, itemId, itemName, itemCount, itemPrice, itemInfo, itemImage):
        itemImage = img_encoder(itemImage[7:])
        update_items(itemId, itemName, itemCount, itemPrice, itemInfo, itemImage)
        self.updateResult.emit(itemName, itemCount, itemPrice, itemInfo, itemImage)

    @Slot(int)
    def deleteItem(self, itemId):
        result = delete_items(itemId)
        # self.updateResult.emit(result)
