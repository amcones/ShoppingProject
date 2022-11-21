import QtQuick
import QtQuick.Controls 6.3

Window {
    width: 650
    height: 400

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Image {
            id: image
            width: 145
            height: 87
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/logo.png"
            anchors.topMargin: 100
            anchors.leftMargin: 20
            sourceSize.height: 300
            sourceSize.width: 500
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\n</style></head><body style=\" font-family:'.AppleSystemUIFont'; font-size:13pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; font-weight:700; color:#000000;\">Market 商品管理系统</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; font-weight:700; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; color:#000000;\">版本：v1.0.0</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; color:#000000;\">构建日期：11月22日 00:16:29</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; color:#000000;\">作者：uli( </span><a name=\"James Amcones\"></a><a href=\"https://github.com/amcones\"><span style=\" font-size:16pt; text-decoration: underline; color:#000000;\">J</span></a><span style=\" font-size:16pt; text-decoration: underline; color:#000000;\">ames Amcones</span><span style=\" font-size:16pt; color:#000000;\"> )</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; color:#000000;\">采用Qt 6.4.0, Pyside6, Python 3.10.7构建</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt; color:#000000;\">按(L)GPL协议开源于Github</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:16pt; color:#000000;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; color:#000000;\">Copyright © 2022 James Amcones &amp; contributors. All rights reserved.</span></p></body></html>"
            anchors.left: image.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            textFormat: Text.RichText
            anchors.bottomMargin: 30
            anchors.topMargin: 30
            anchors.rightMargin: 30
            anchors.leftMargin: 30
        }
    }

}
