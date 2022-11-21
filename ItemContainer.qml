import QtQuick
import QtQuick.Controls 6.3
import Qt5Compat.GraphicalEffects

Item {
    width: 280
    height: 430

    DropShadow{
        anchors.fill: itemContainerRect
        radius: 10.0
        color: "#9b000000"
        source: itemContainerRect
    }

    Rectangle {
        id: itemContainerRect
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        radius:10

        Image {
            id: image
            height: 200
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            source: "images/iphone14pro.png"
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            sourceSize.height: 300
            sourceSize.width: 300
            anchors.topMargin: 5
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1
            text: qsTr("iPhone 14 Pro")
            anchors.top: image.bottom
            font.pixelSize: 20
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text2
            text: qsTr("RMB 7999")
            anchors.top: text1.bottom
            font.pixelSize: 12
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            width: 188
            height: 58
            text: qsTr("iPhone 巅峰之作")
            anchors.top: text2.bottom
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: purchaseBtn
            width: 100
            height: 25
            text: qsTr("加入购物车")
            anchors.top: text3.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            background: Rectangle{
                width: 100
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                color: purchaseBtn.hovered?purchaseBtn.pressed?"#ff000000":"#aa000000":"#ee000000"
            }
        }
    }
}


