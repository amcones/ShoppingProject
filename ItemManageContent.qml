import QtQuick
import QtQuick.Controls 6.3

Item {
    width: 900
    height: 900

    Component.onCompleted:{
        itemColumn.resetItems()
        mainContentBackend.selectAllItems()
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("商品管理")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 32
            anchors.topMargin: 50
            anchors.leftMargin: 50
        }

        Button {
            id: newItemBtn
            x: 744
            width: 80
            height: 40
            text: qsTr("添加新物品")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.rightMargin: 80
            background: Rectangle{
                width: 100
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                color: newItemBtn.hovered?newItemBtn.pressed?"#ff000000":"#aa000000":"#ee000000"
            }
            onClicked: {
                var component = Qt.createComponent("newItemDialog.qml")
                print(component.errorString())
                if(component.status === Component.Ready){
                    var win = component.createObject()
                    win.show()
                }
            }
        }

        Rectangle {
            id: rectangle1
            height: 20
            color: "#eeeeee"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: newItemBtn.bottom
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 20

            Rectangle {
                id: rectangle2
                width: 60
                color: "#eeeeee"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text2
                    text: qsTr("ID")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle3
                width: 120
                color: "#eeeeee"
                anchors.left: rectangle2.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text3
                    text: qsTr("名字")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle4
                width: 80
                color: "#eeeeee"
                anchors.left: rectangle3.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Text {
                    id: text4
                    text: qsTr("数量")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle5
                width: 90
                color: "#eeeeee"
                anchors.left: rectangle4.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Text {
                    id: text5
                    text: qsTr("价格")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle6
                width: 200
                color: "#eeeeee"
                anchors.left: rectangle5.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Text {
                    id: text6
                    text: qsTr("介绍")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle7
                width: 180
                color: "#eeeeee"
                anchors.left: rectangle6.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text7
                    text: qsTr("图片")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle8
                width: 50
                color: "#eeeeee"
                anchors.left: rectangle7.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text8
                    text: qsTr("操作")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Flickable {
            id: flickable
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            clip: true
            contentHeight: itemColumn.height
            anchors.bottomMargin: 20
            contentWidth: flickable.width
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 0
            ScrollBar.vertical: ScrollBar { id: scrollBar ; visible: true; anchors.top: parent.top; anchors.bottom: parent.bottom; active: true; clip: false; anchors.bottomMargin: 0;anchors.topMargin: 0 }

            Column {
                id: itemColumn
                height: itemColumn.implicitHeight
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                spacing: 2

                function resetItems(){
                    for(var i = itemColumn.children.length; i > 0 ; i--) {
                        itemColumn.children[i-1].destroy()
                    }
                }

                ItemControl {
                    id: itemControl
                }

                ItemControl {
                    id: itemControl1
                }

                ItemControl {
                    id: itemControl2
                }

                ItemControl {
                    id: itemControl3
                }

                ItemControl {
                    id: itemControl4
                }

                ItemControl {
                    id: itemControl5
                }

                ItemControl {
                    id: itemControl6
                }

                ItemControl {
                    id: itemControl7
                }

                ItemControl {
                    id: itemControl8
                }

                ItemControl {
                    id: itemControl9
                }

                ItemControl {
                    id: itemControl10
                }

                ItemControl {
                    id: itemControl11
                }

                ItemControl {
                    id: itemControl12
                }

                ItemControl {
                    id: itemControl13
                }

                ItemControl {
                    id: itemControl14
                }
            }

            Connections{
                target: mainContentBackend

                function onSelectSuccess(id,name,count,price,info,img){
                    var component = Qt.createComponent("ItemControl.qml",itemColumn)
                    print(component.errorString())
                    if(component.status === Component.Ready){
                        var itemControl = component.createObject(itemColumn,{"width":800})
                        itemControl.itemId = id
                        itemControl.itemName = name
                        itemControl.itemCount = count
                        itemControl.itemPrice = price
                        itemControl.itemInfo = info
                        itemControl.itemImage = img
                    }
                }
            }
        }
    }

}


