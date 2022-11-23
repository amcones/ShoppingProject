import QtQuick
import QtQuick.Controls 6.3

Item {
    width: 900
    height: 900

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("用户管理")
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
            text: qsTr("添加新用户")
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
                width: 550
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
                width: 120
                color: "#eeeeee"
                anchors.left: rectangle3.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Text {
                    id: text4
                    text: qsTr("是否管理")
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
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 20
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
                id: userColumn
                height: userColumn.implicitHeight
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                spacing: 2


            }

        }
    }

}


