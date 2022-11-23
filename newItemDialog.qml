import QtQuick
import QtQuick.Controls 6.3
import QtQuick.Dialogs


Window {
    id: newItemDialogWindow
    width: 330
    height: 450


    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("新建物品")
            anchors.top: parent.top
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
        }

        Row {
            id: row
            x: 30
            y: 73
            width: 150
            height: 20

            Text {
                id: text2
                height: 20
                text: qsTr("名称：")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: itemNameTextField
                width: 120
                height: 20
                placeholderTextColor: "#747474"
                placeholderText: qsTr("输入物品名称")
                color:"#000000"
                background:Rectangle{
                    color:"#eeeeee"
                    radius:5
                }
            }
        }

        Row {
            id: row1
            x: 30
            y: 108
            width: 150
            height: 20

            Text {
                id: text3
                height: 20
                text: qsTr("数量：")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: itemCountTextField
                width: 120
                height: 20
                placeholderTextColor: "#747474"
                placeholderText: qsTr("输入物品数量")
                color:"#000000"
                background:Rectangle{
                    color:"#eeeeee"
                    radius:5
                }
            }
        }

        Row {
            id: row2
            x: 30
            y: 141
            width: 150
            height: 20

            Text {
                id: text4
                height: 20
                text: qsTr("价格：")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: itemPriceTextField
                width: 120
                height: 20
                placeholderTextColor: "#747474"
                placeholderText: qsTr("输入物品价格")
                color:"#000000"
                background:Rectangle{
                    color:"#eeeeee"
                    radius:5
                }
            }
        }

        Row {
            id: row3
            x: 30
            y: 177
            width: 150
            height: 20

            Text {
                id: text5
                text: qsTr("简介：")
                font.pixelSize: 12
            }

            TextField {
                id: itemInfoTextField
                width: 120
                height: 20
                placeholderTextColor: "#747474"
                placeholderText: qsTr("输入物品简介")
                color:"#000000"
                background:Rectangle{
                    color:"#eeeeee"
                    radius:5
                }
            }
        }

        Row {
            id: row4
            x: 30
            y: 216
            width: 251
            height: 117
            spacing: 20


            Text {
                id: text6
                y: 43
                text: qsTr("图片：")
                font.pixelSize: 12
            }


            Button {
                id: openImgBtn
                y: 38
                width: 50
                height: 25
                text: qsTr("打开图片")
                background: Rectangle{
                    width: 70
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: openImgBtn.hovered?openImgBtn.pressed?"#ff000000":"#aa000000":"#ee000000"
                }
                FileDialog {
                        id: fileDialog
                        fileMode: FileDialog.OpenFile
                        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
                        options: FileDialog.ReadOnly
                        onAccepted: {
                            console.log(fileDialog.currentFile)
                        }
                    }
                onClicked: {
                    fileDialog.open()
                }
            }
            Image {
                id: itemImage
                y: 0
                width: 100
                height: 100
                source: fileDialog.currentFile
                fillMode: Image.PreserveAspectFit
            }
        }

        Button {
            id: sureBtn
            y: 389
            width: 70
            height: 30
            text: qsTr("确认添加")
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle{
                width: 70
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                color: sureBtn.hovered?sureBtn.pressed?"#ff000000":"#aa000000":"#ee000000"
            }
            onClicked: {
                updateItemBackend.insertItem(itemNameTextField.text,itemCountTextField.text,itemPriceTextField.text,itemInfoTextField.text,fileDialog.currentFile)
                newItemDialogWindow.destroy()
            }
        }
    }
    Connections{
        target: updateItemBackend
        function onUpdateResult(result){
            print(result)
        }
    }
}
