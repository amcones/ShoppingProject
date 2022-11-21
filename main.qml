import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.3
import Qt5Compat.GraphicalEffects

Window {
    id: loginWindow
    width: 1024
    height: 648
    visible: true
    title: qsTr("Market")

    Column {
        id: column
        width: 600
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        topPadding: 100

        Text {
            id: text1
            text: qsTr("登录到 Market")
            anchors.top: parent.top
            font.pixelSize: 36
            anchors.topMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }


        Button {
            id: loginButton
            width: 200
            height: 28
            text: "登录"
            anchors.top: text1.bottom
            anchors.topMargin: 300
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle{
                width: 200
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                color: loginButton.hovered?loginButton.pressed?"#ff000000":"#aa000000":"#ee000000"
            }
            onPressed: {
                loginBackend.checkLogin(accountTextField.text,passwordTextField.text)
            }
        }

        TextField {
            id: accountTextField
            width: 200
            height: 30
            focus: true
            color: "#000000"
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pointSize: 14
            placeholderTextColor: "#b8000000"
            placeholderText: qsTr("请输入账号")
            Keys.onReturnPressed: passwordTextField.focus=true // Enter key
            Keys.onEnterPressed: passwordTextField.focus=true // Numpad enter key
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: 30
            renderType: Text.QtRendering
            anchors.topMargin: 225
            background: Rectangle{
                border.color: "#ee000000"
                border.width: accountTextField.focus?2:1
                activeFocusOnTab: true
                radius: 5
            }
            Image {
                id: image1
                width: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "images/我的.svg"
                sourceSize.height: 20
                sourceSize.width: 20
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                anchors.leftMargin: 5
                fillMode: Image.PreserveAspectFit
            }
        }

        TextField {
            id: passwordTextField
            width: 200
            height: 30
            color: "#000000"
            anchors.top: accountTextField.bottom
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pointSize: 14
            placeholderTextColor: "#b8000000"
            placeholderText: qsTr("请输入密码")
            echoMode: "Password"
            verticalAlignment: Text.AlignVCenter
            leftPadding: 30
            renderType: Text.QtRendering
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle{
                border.color: "#ee000000"
                border.width: passwordTextField.focus?2:1
                radius: 5
            }
            Keys.onReturnPressed: loginBackend.checkLogin(accountTextField.text,passwordTextField.text) // Enter key
            Keys.onEnterPressed: loginBackend.checkLogin(accountTextField.text,passwordTextField.text) // Numpad enter key

            Image {
                id: image2
                width: 20
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "images/密码.svg"
                anchors.topMargin: 5
                fillMode: Image.PreserveAspectFit
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                sourceSize.height: 20
                sourceSize.width: 20
            }
        }

        Text {
            id: loginInfoText
            width: accountTextField.width
            color: "#ff0000"
            text: qsTr("")
            anchors.top: passwordTextField.bottom
            font.pixelSize: 14
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text4
            width: 290
            height: 30
            color: "#78000000"
            text: qsTr("Copyright © 2022 James Amcones & contributors. All rights reserved.")
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 50
        }
    }

    Rectangle {
        id: rectangle
        visible: true
        color: "#ee000000"
        anchors.left: column.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0

        Image {
            id: image
            width: 250
            height: 250
            anchors.top: parent.top
            source: "images/线下购物.svg"
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit

        }

        DropShadow
            {
                anchors.fill: image
                horizontalOffset: -2
                verticalOffset: 5
                radius: 8.0
                color: "#6d6fc6ff"
                source: image
            }

        Text {
            id: text2
            width: 213
            height: 71
            color: "#ffffff"
            text: qsTr("在Market购买您的心仪物品")
            anchors.top: image.bottom
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            renderTypeQuality: Text.VeryHighRenderTypeQuality
            renderType: Text.QtRendering
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            y: 449
            width: 189
            height: 54
            color: "#55ffffff"
            text: qsTr("我们始终坚持以高品质的商品，高标准的要求，高强度的检查来保障用户的购物体验。")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            renderTypeQuality: Text.VeryHighRenderTypeQuality
            renderType: Text.QtRendering
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Connections{
        target: loginBackend
        function onErr(info){
            loginInfoText.text=info
        }
        function onSuccess(account,isadmin){
            loginInfoText.text=""
            var component = Qt.createComponent("MainPage.qml")
            print(component.errorString())
            if(component.status === Component.Ready){
                var win = component.createObject()
                win.account = account
                win.isadmin=isadmin
                win.loginwin=loginWindow
                win.show()
                visible=false
            }
        }
    }

    Image {
        id: image3
        width: 100
        height: 60
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/logo.png"
        anchors.topMargin: 5
        anchors.leftMargin: 15
        sourceSize.height: 300
        sourceSize.width: 500
        fillMode: Image.PreserveAspectFit
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
