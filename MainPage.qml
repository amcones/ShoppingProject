import QtQuick
import QtQuick.Controls 6.3

Window {
    id: mainWindow
    width: 1200
    height: 900
    property string account
    property bool isadmin
    property var loginwin

    Rectangle {
        id: sideBarRect
        width: 300
        color: "#f9f7f7"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0

        Image {
            id: logoImage
            x: 0
            y: 0
            width: sideBarRect.width
            height: 145
            source: "images/logo.png"
            sourceSize.height: 300
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
        }

        Button {
            id: homeBtn
            property bool isCheck: true
            x: 0
            width: 300
            height: 80
            text: "主页"
            anchors.top: logoImage.bottom
            anchors.topMargin: 60
            onClicked:{
                homeBtn.isCheck=true
                itemManageBtn.isCheck=false
                userManagerBtn.isCheck=false
            }
            contentItem:
                Text {
                width: sideBarRect.width
                text: homeBtn.text
                font: homeBtn.font
                color: homeBtn.isCheck||homeBtn.hovered ? "#ffffff":"#8992a4"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 0
                leftPadding: 100
                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
            }
            font.pointSize: 20
            rightPadding: 0
            bottomPadding: 0
            leftPadding: 0
            topPadding: 0
            background:Rectangle{
                color: homeBtn.isCheck?"#ee000000":homeBtn.hovered?"#aa000000":"#f9f7f7"
                radius:20
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10

            }

            Image {
                id: homeImage
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: homeBtn.isCheck||homeBtn.hovered?"images/购物车 (白).svg":"images/购物车.svg"
                anchors.leftMargin: 40
                sourceSize.height: 30
                sourceSize.width: 30
                fillMode: Image.PreserveAspectFit
            }
        }

        Button {
            id: itemManageBtn
            property bool isCheck: false
            x: 0
            y: 245
            height: 80
            text: qsTr("商品管理")
            onClicked:{
                homeBtn.isCheck=false
                itemManageBtn.isCheck=true
                userManagerBtn.isCheck=false
            }
            contentItem:
                Text {
                text: itemManageBtn.text
                font: itemManageBtn.font
                color: itemManageBtn.isCheck||itemManageBtn.hovered ? "#ffffff":"#8992a4"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 100
                elide: Text.ElideRight
                anchors.fill: parent
            }
            background:Rectangle{
                radius:20
                color: itemManageBtn.isCheck?"#ee000000":itemManageBtn.hovered?"#aa000000":"#f9f7f7"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10


            }
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: homeBtn.bottom
            leftPadding: 0
            font.pointSize:20
            icon.color: "#88000000"
            anchors.topMargin: 20
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            Image {
                id: itemImage
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: itemManageBtn.isCheck||itemManageBtn.hovered?"images/代发货 (白).svg":"images/代发货.svg"
                anchors.leftMargin: 40
                sourceSize.height: 30
                sourceSize.width: 30
                fillMode: Image.PreserveAspectFit
            }
        }

        Button {
            id: userManagerBtn
            property bool isCheck: false
            x: 0
            y: 345
            height: 80
            text: qsTr("用户管理")

            onClicked:{
                homeBtn.isCheck=false
                itemManageBtn.isCheck=false
                userManagerBtn.isCheck=true
            }
            contentItem:
                Text {
                text: userManagerBtn.text
                font: userManagerBtn.font
                color: userManagerBtn.isCheck||userManagerBtn.hovered ? "#ffffff":"#8992a4"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 100
                elide: Text.ElideRight
                anchors.fill: parent
            }
            background:Rectangle{
                color: userManagerBtn.isCheck?"#ee000000":userManagerBtn.hovered?"#aa000000":"#f9f7f7"
                radius:20
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10

            }
            font.pointSize: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: itemManageBtn.bottom
            anchors.topMargin: 20
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            Image {
                id: userImage
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: userManagerBtn.isCheck||userManagerBtn.hovered?"images/employee (白).svg":"images/employee.svg"
                anchors.leftMargin: 40
                sourceSize.height: 30
                sourceSize.width: 30
                fillMode: Image.PreserveAspectFit
            }
        }

        Button {
            id: logoutBtn
            y: 795
            text: qsTr("退出登录")
            onClicked: {
                loginwin.show()
                mainWindow.destroy()
            }

            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 30
            anchors.bottomMargin: 40
            font.pointSize: 16
            contentItem:
                Text {
                text: logoutBtn.text
                font: logoutBtn.font
                color: logoutBtn.hovered ? logoutBtn.pressed?"#006C7A":"#ee000000":"#8992a4"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 40

                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter
            }
            background:Rectangle{
                color: "#00ffffff"

            }

            Image {
                id: image
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                source: "images/logout.svg"
                sourceSize.height: 30
                sourceSize.width: 30
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle
            width: 250
            height: 1
            color: "#d29da9bf"
            anchors.top: logoImage.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: aboutBtn
            onClicked: {
                var component = Qt.createComponent("aboutDialog.qml")
                print(component.errorString())
                if(component.status === Component.Ready){
                    var win = component.createObject()
                    win.show()
                }
            }

            y: 795
            width: 103
            height: 26
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            checkable: false
            enabled: true
            font.pointSize: 16
            Image {
                id: image1
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                source: "images/举报.svg"
                sourceSize.height: 30
                sourceSize.width: 30
                fillMode: Image.PreserveAspectFit
            }
            contentItem: Text {
                height: 23
                color: aboutBtn.hovered ? aboutBtn.pressed?"#006C7A":"#ee000000":"#8992a4"
                text: "关于"
                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 40
                font: aboutBtn.font
            }
            background: Rectangle {
                color: "#00ffffff"
            }
            anchors.bottomMargin: 80
            anchors.leftMargin: 30
        }

    }

    MainContent {
        id: mainContent
        anchors.left: sideBarRect.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:2}D{i:3}D{i:8}D{i:15}D{i:20}D{i:24}
}
##^##*/
