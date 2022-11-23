import QtQuick
import QtQuick.Controls 6.3
import QtQuick.Dialogs

Item {
    id: itemControlItem
    width: 800
    height: 50

    property int itemId
    property string itemName
    property int itemCount
    property double itemPrice
    property string itemInfo
    property string itemImage

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            width: 60
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Text {
                id: text1
                text: qsTr(itemId.toString())
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: rectangle2
            width: 120
            color: "#ffffff"
            anchors.left: rectangle1.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            TextEdit {
                id: itemNameTextEdit
                text: qsTr(itemName)
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Keys.onReturnPressed: {
                    updateItemBackend.updateItem(itemId, itemNameTextEdit.text,
                                                 itemCountTextEdit.text,
                                                 itemPriceTextEdit.text,
                                                 itemInfo, itemImage)
                }
            }
        }

        Rectangle {
            id: rectangle3
            width: 80
            color: "#ffffff"
            anchors.left: rectangle2.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            TextEdit {
                id: itemCountTextEdit
                text: qsTr(itemCount.toString())
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Keys.onReturnPressed: {
                    updateItemBackend.updateItem(itemId, itemNameTextEdit.text,
                                                 itemCountTextEdit.text,
                                                 itemPriceTextEdit.text,
                                                 itemInfoTextEdit.text,
                                                 itemImage)
                }
            }
        }

        Rectangle {
            id: rectangle4
            width: 90
            color: "#ffffff"
            anchors.left: rectangle3.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            TextEdit {
                id: itemPriceTextEdit
                text: qsTr(itemPrice.toString())
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Keys.onReturnPressed: {
                    updateItemBackend.updateItem(itemId, itemNameTextEdit.text,
                                                 itemCountTextEdit.text,
                                                 itemPriceTextEdit.text,
                                                 itemInfoTextEdit.text,
                                                 itemImage)
                }
            }
        }

        Rectangle {
            id: rectangle5
            width: 200
            color: "#ffffff"
            anchors.left: rectangle4.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            TextEdit {
                id: itemInfoTextEdit
                text: qsTr(itemInfo)
                anchors.fill: parent
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Keys.onReturnPressed: {
                    updateItemBackend.updateItem(itemId, itemNameTextEdit.text,
                                                 itemCountTextEdit.text,
                                                 itemPriceTextEdit.text,
                                                 itemInfoTextEdit.text,
                                                 itemImage)
                }
            }
        }

        Rectangle {
            id: rectangle6
            width: 180
            color: "#ffffff"
            anchors.left: rectangle5.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            FileDialog {
                id: fileDialog
                fileMode: FileDialog.OpenFile
                nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
                options: FileDialog.ReadOnly
                onAccepted: {
                    updateItemBackend.updateItem(itemId, itemNameTextEdit.text,
                                                 itemCountTextEdit.text,
                                                 itemPriceTextEdit.text,
                                                 itemInfoTextEdit.text,
                                                 fileDialog.currentFile)
                }
            }
            MouseArea {
                anchors.fill: parent
                onDoubleClicked: {
                    fileDialog.open()
                }
            }
            Image {
                id: image
                width: 180
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: itemImage.length > 0 ? "data:image/png;base64," + itemImage : ""
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle7
            width: 50
            color: "#ffffff"
            anchors.left: rectangle6.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Button {
                id: deleteBtn
                text: qsTr("")
                anchors.fill: parent
                anchors.rightMargin: 12
                anchors.leftMargin: 12
                anchors.bottomMargin: 12
                anchors.topMargin: 12
                icon.source: "images/关闭.svg"
                background: Rectangle {
                    id: deleteBtnBgRect
                    radius: 15
                    color: "#ee000000"
                }
                onClicked: {
                    updateItemBackend.deleteItem(itemId)
                    itemControlItem.destroy()
                }
            }
        }
    }
    states: [
        State {
            name: "to_delete"
            when: deleteBtn.hovered
            PropertyChanges {
                target: deleteBtnBgRect
                color: "red"
                radius: 5
            }
        }
    ]
    transitions: Transition {
        ColorAnimation {
            duration: 300
        }

        NumberAnimation {
            target: deleteBtnBgRect
            property: "radius"
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }
    Connections {
        target: updateItemBackend
        function onUpdateResult(newItemName,newItemCount,newItemPrice,newItemInfo,newItemImage) {
//            itemName = newItemName
//            itemCount = newItemCount
//            itemPrice = newItemPrice
//            itemInfo = newItemInfo
//            itemImage = newItemImage
            print(itemName)
        }
    }
}
