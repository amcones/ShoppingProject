import QtQuick
import QtQuick.Controls 6.3

Item {
    id: mainContainerItem
    width: 900
    height: 900
    property alias searchBarContainerRect: searchBarContainerRect
    property string user
    Component.onCompleted:{
        itemFlow.resetItems()
        mainContentBackend.selectAllItems()
    }


    Rectangle {
        id: contentRect
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: topBarRect
            height: 120
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            Rectangle {
                id: searchBarContainerRect
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: false
                anchors.rightMargin: 200
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                TextField {
                    id: searchTextField
                    x: 50
                    y: 30
                    function showSearchResult()
                    {
                        itemFlow.resetItems()
                        mainContentBackend.searchItems(searchTextField.text)
                    }
                    Keys.onReturnPressed: showSearchResult() // Enter key
                    Keys.onEnterPressed: showSearchResult() // Numpad enter

                    onTextChanged: {
                        if(searchTextField.text.length===0){
                            //itemFlow.resetItems()
                            //mainContentBackend.selectAllItems()

                        }
                    }

                    color: "#000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pointSize: 20
                    placeholderTextColor: "#747474"
                    placeholderText: "输入物品名或ID进行查询"
                    anchors.rightMargin: 20


                    verticalAlignment: Text.AlignVCenter
                    clip: false
                    anchors.bottomMargin: 30
                    anchors.topMargin: 30
                    anchors.leftMargin: 20
                    rightPadding: 20
                    leftPadding: 20
                    background:Rectangle{
                        color:"#eeeeee"
                        radius:10
                    }

                    Button {
                        id: searchBtn
                        x: 620
                        width: 60
                        text: qsTr("")
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: false
                        rightPadding: 0
                        leftPadding: 0
                        icon.color: "#eeeeee"
                        icon.source: "images/放大镜.svg"
                        background: Rectangle{
                            radius:10
                            color: searchBtn.hovered?searchBtn.pressed?"#ff000000":"#aa000000":"#ee000000"
                        }
                        onPressed: {
                            searchTextField.showSearchResult()
                        }
                    }
                }
            }

            Rectangle {
                id: userInfoBarRect
                width: 200
                color: "#00ffffff"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: rectangle1
                    color: "#eeeeee"
                    radius: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 30
                    anchors.rightMargin: 30
                    anchors.bottomMargin: 30
                    anchors.topMargin: 30

                    Rectangle {
                        id: rectangle2
                        width: 50
                        color: "#ffffff"
                        radius: 25
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 5
                        anchors.topMargin: 5
                    }

                    Image {
                        id: userAvaterImage
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "images/个人.svg"
                        sourceSize.height: 30
                        sourceSize.width: 30
                        anchors.leftMargin: 15
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text1
                        x: 67
                        width: 81
                        height: 19
                        text: user
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                    }

                }
            }

        }

        Flickable {
            id: flickable
            parent: flickable.parent
            anchors.top: topBarRect.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            clip: true
            contentHeight: itemFlow.height
            contentWidth: flickable.width
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 20
            anchors.topMargin: 0
            ScrollBar.vertical: ScrollBar { id: scrollBar ; visible: true; anchors.top: parent.top; anchors.bottom: parent.bottom; active: true; clip: false; anchors.bottomMargin: 0;anchors.topMargin: 0 }
            Flow {
                id: itemFlow
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                rightPadding: 20
                leftPadding: 20
                spacing: 5
                anchors.rightMargin: 0

                function resetItems(){
                        for(var i = itemFlow.children.length; i > 0 ; i--) {
                            itemFlow.children[i-1].destroy()
                            print("销毁了一个孩子")
                        }
                }
            }
        }

        Connections{
            target: mainContentBackend

            function onSelectSuccess(id,name,count,price,info,img){
                var component = Qt.createComponent("ItemContainer.qml")
                print(component.errorString())
                if(component.status === Component.Ready){
                    var itemContainer = component.createObject(itemFlow,{"width":280})
                    itemContainer.itemId = id
                    itemContainer.itemName = name
                    itemContainer.itemPrice = price
                    itemContainer.itemInfo = info
                    itemContainer.itemImage = img
                }
                component.destroy()
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
