import QtQuick 2.7
import QtQuick.Window 2.0



Window {
    id: baseballTable
    visible: true
    property alias textPuntiHome: textPuntiHome.text
    property alias textPuntiVisitor: textPuntiVisitor.text
    property alias imageBallHome: imageBallHome.visible
    property alias imageBallVis: imageBallVis.visible

    width: 500
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
        width: 118
        height: 68
        radius: 8
        border.width: 3
        anchors.top: rectSquadre.bottom
        anchors.topMargin: 0

        Text {
            id: textConteggio
            text: qsTr("0 - 0")
            anchors.fill: parent
            font.pixelSize: 32
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
            font.pixelSize: 16
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

            Image {
                id: imageBallVis
                width: 30
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "images/ball.png"
                anchors.topMargin: 5
                anchors.bottomMargin: 4
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: textVisitor
                text: qsTr("Visitor")
                anchors.left: imageBallVis.right
                anchors.top: parent.top
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 6
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

            Image {
                id: imageBallHome
                width: 30
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "images/ball.png"
                anchors.bottomMargin: 4
                fillMode: Image.PreserveAspectFit
                anchors.topMargin: 5
            }

            Text {
                id: textHome
                text: qsTr("Home")
                anchors.left: imageBallHome.right
                anchors.top: parent.top
                font.pixelSize: 14
                anchors.topMargin: 6
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
        width: 70
        height: 70
        radius: 8
        border.color: "#474fff"
        border.width: 3
        anchors.right: parent.right
        anchors.top: rectSquadre.bottom
        anchors.topMargin: 0
        Text {
            id: textTopBot
            text: "TOP"
            anchors.top: parent.top
            font.pixelSize: 13
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
            font.pointSize: 25
            anchors.topMargin: 11
        }

    }

    Rectangle {
        id: rectBasi
        width: 87
        height: 60
        opacity: 0.859
        color: "#fedddd"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 66


        Base {
            id: base1score
            width: 30
            height: 30
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 22
            rotation: 45
        }


        Base {
            id: base2score
            width: 30
            height: 30
            rotation: 45
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Base {
            id: base3score
            width: 30
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 22
            rotation: 45
        }
    }

    Rectangle {
        id: rectAtBat
        color: "#dde0ff"
        border.color: "#c1ceff"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectConteggio.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Text {
            id: textAtBat
            text: qsTr("AT BAT: XXX YYY")
            anchors.fill: parent
            font.pixelSize: 15
            verticalAlignment: Text.AlignVCenter
            leftPadding: 7
            font.weight: Font.Bold
        }
    }
}


