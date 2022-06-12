import QtQuick 2.7
import QtQuick.Window 2.0



Window {
    id: baseballTable
    visible: true

    width: 400
    height: 150

    // Proprietà gestire dalla finestra principale
    property alias visitorColor : rectVisitor.color
    property alias homeColor : rectHome.color
    property alias homeName : textHome.text
    property alias visitorName : textVisitor.text

    property alias conteggioText : textConteggio.text
    property alias outText : textOut.text
    property alias inningText: textInning.text
    property alias topBottomText: textTopBot.text



    Rectangle{
        id: rectConteggio
        x: 0
        y: 71
        width: 118
        height: 80
        radius: 4
        border.width: 2
        anchors.bottom: parent.bottom

        Text {
            id: textConteggio
            text: qsTr("0 - 0")
            anchors.fill: parent
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            anchors.topMargin: 5
            font.bold: true
        }

        Text {
            id: textOut
            text: qsTr("0 out")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottomMargin: 6
            anchors.leftMargin: 0
        }
    }

    Rectangle{
        id: rectSquadre
        height: 61
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0
        Rectangle{
            id: rectVisitor
            height: 30
            color: "#f9e8e8"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Text {
                id: textVisitor
                text: qsTr("Visitor")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 6
                anchors.leftMargin: 8
                font.bold: true
            }

            Text {
                id: textPuntiVisitor
                x: 140
                y: 0
                text: qsTr("0")
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
                anchors.rightMargin: 10
                font.bold: true
            }
        }
        Rectangle{
            id: rectHome
            height: 30
            color: "#e6fdee"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Text {
                id: textHome
                text: qsTr("Home")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 14
                anchors.topMargin: 6
                anchors.leftMargin: 8
                font.bold: true
            }

            Text {
                id: textPuntiHome
                x: 140
                y: 0
                text: qsTr("0")
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
                font.bold: true
                anchors.rightMargin: 10
            }
        }
    }

    Rectangle{
        id: rectInning
        width: 80
        height: 80
        radius: 8
        border.color: "#474fff"
        border.width: 3
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Text {
            id: textTopBot
            text: ""
            anchors.top: parent.top
            font.pixelSize: 15
            font.bold: true
            anchors.topMargin: 8
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: textInning
            text: inning
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 30
            anchors.topMargin: 11
        }

    }
}

/*##^##
Designer {
    D{i:0;height:200;width:200}
}
##^##*/
