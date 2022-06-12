import QtQuick 2.0

Item {
    id: item1
    width: 100
    height: 200
    property alias textDataText: textData.text

    signal pressedUp
    signal pressedDown


    Rectangle {
        id: rectUp
        height: 50
        color: "#c6ffde"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        MouseArea {
            id: mouseAreaUp
            anchors.fill: parent
            onClicked: pressedUp()
        }
    }

    Rectangle {
        id: rectData
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectUp.bottom
        anchors.bottom: rectDown.top

        Text {
            id: textData
            text: qsTr("Text")
            anchors.fill: parent
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }
    }

    Rectangle {
        id: rectDown
        y: 175
        height: 50
        color: "#ffe6e6"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        MouseArea {
            id: mouseAreaDown
            anchors.fill: parent
            onClicked: pressedDown()
        }
    }

}
