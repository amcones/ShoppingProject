import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.3

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

                //                if(info=="-1"){
                //                    loginInfoText.text="用户不存在"
                //                }
                //                else if(info==="0"){
                //                    loginInfoText.text="用户名或密码错误"
                //                }
                //                else{

                //                }
            }
        }

        TextField {
            id: accountTextField
            width: 200
            height: 30
            color: "#000000"
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pointSize: 14
            placeholderTextColor: "#b8000000"
            placeholderText: qsTr("请输入账号")
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
            print(account)
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:7}D{i:5}D{i:10}D{i:8}D{i:11}D{i:12}D{i:1}D{i:14}
D{i:15}D{i:16}D{i:13}
}
##^##*/
