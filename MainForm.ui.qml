import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id: main
    width: 900
    height: 600
    property alias upDownPunti: upDownPunti
    property alias btnLoadHome: btnLoadHome
    property alias btnLoadVisitor: btnLoadVisitor
    property alias mouseAreaHome: mouseAreaHome
    property alias mouseAreaVisitor: mouseAreaVisitor
    property alias base1: base1
    property alias base3: base3
    property alias base2: base2
    property alias upDownInning: upDownInning

    property alias upDownOut: upDownOut
    property alias upDownBall: upDownBall
    property alias rectColorHome: rectColorHome
    property alias rectColorVisitor: rectColorVisitor
    property alias mouseAreaColorVisitor: mouseAreaColorVisitor
    property alias mouseAreaColorHome: mouseAreaColorHome
    property alias buttonReset: buttonReset
    property alias textInputVisitor: textInputVisitor
    property alias textInputHome: textInputHome
    property alias upDownStrike: upDownStrike

    //signal pressedStrikeUp
    //signal pressedStrikeDn

    RowLayout {
        id: rowTitle
        x: -174
        y: 9
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: textTitle
            color: "#882929"
            text: qsTr("Baseball Scoreboard")
            font.pixelSize: 40
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.family: "Arial"
            font.bold: true
        }
    }

    RowLayout {
        id: rowHomeVisitor
        y: 85
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowTitle.bottom
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 29

        ColumnLayout {
            id: columnLayout
            layer.enabled: false
            Layout.fillWidth: true

            RowLayout {
                id: rowLayoutVisitor
                Layout.fillWidth: true

                Rectangle {
                    id: rectColorVisitor
                    width: 50
                    height: 50
                    color: "#ff0000"

                    MouseArea {
                        id: mouseAreaColorVisitor
                        anchors.fill: parent
                    }
                }

                Text {
                    id: textVisitor
                    text: qsTr("Visitor")
                    font.pixelSize: 30
                    Layout.rightMargin: 15
                    font.bold: true

                    MouseArea {
                        id: mouseAreaVisitor
                        anchors.fill: parent
                    }
                }

                TextInput {
                    id: textInputVisitor
                    color: "#433aff"
                    text: nameVisitor
                    font.pixelSize: 30
                    Layout.fillWidth: true
                    selectByMouse: true
                    padding: 2
                    rightPadding: 20
                    leftPadding: 20
                }

                Button {
                    id: btnLoadVisitor
                    text: qsTr("Carica Visitor")
                    font.pointSize: 15
                }
            }

            RowLayout {
                id: rowLayoutHome
                width: 100
                height: 100

                Rectangle {
                    id: rectColorHome
                    width: 50
                    height: 50
                    color: "#ffffff"

                    MouseArea {
                        id: mouseAreaColorHome
                        anchors.fill: parent
                    }
                }

                Text {
                    id: textHome
                    text: qsTr("Home")
                    font.pixelSize: 30
                    Layout.rightMargin: 20
                    font.bold: true

                    MouseArea {
                        id: mouseAreaHome
                        anchors.fill: parent
                    }
                }

                TextInput {
                    id: textInputHome
                    color: "#433aff"
                    text: nameHome
                    font.pixelSize: 30
                    Layout.fillWidth: true
                    focus: true
                    cursorVisible: true
                    rightPadding: 20
                    leftPadding: 20
                    selectByMouse: true
                }

                Button {
                    id: btnLoadHome
                    text: qsTr("Carica Home")
                    Layout.fillWidth: false
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    transformOrigin: Item.Center
                    flat: false
                    font.pointSize: 15
                }
            }
        }
    }

    RowLayout {
        id: rowCounts
        x: -278
        y: 206
        anchors.top: rowHomeVisitor.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20

        Row {
            id: rowStrike
            Layout.rightMargin: 20
            Layout.leftMargin: 20

            Text {
                id: textStrike
                text: qsTr("Strike")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            UpDown {
                id: upDownStrike
                width: 80
                textDataText: strike
            }
        }

        Row {
            id: rowBall
            Layout.rightMargin: 20
            Layout.leftMargin: 20

            Text {
                id: textBall
                text: qsTr("Ball")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            UpDown {
                id: upDownBall
                width: 80
                textDataText: ball
            }
        }

        Row {
            id: rowOut
            Layout.rightMargin: 20
            Layout.leftMargin: 20

            Text {
                id: textOut
                text: qsTr("Out")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            UpDown {
                id: upDownOut
                width: 80
                textDataText: out
            }
        }

        RowLayout {
            id: rowInning
            width: 100
            height: 100

            Text {
                id: textOut1
                text: qsTr("Inning")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            UpDown {
                id: upDownInning
                width: 80
                textDataText: inning
            }
        }

        RowLayout {
            id: rowPunteggio
            width: 100
            height: 100
            Text {
                id: textOut2
                text: qsTr("Punti")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            UpDown {
                id: upDownPunti
                width: 80
                textDataText: "1"
            }
        }
    }

    CheckBox {
        id: checkBoxFinale
        x: 33
        y: 433
        text: qsTr("Finale")
        hoverEnabled: true
        enabled: true
        spacing: 8
        font.bold: true
        font.pointSize: 25
    }

    Button {
        id: buttonReset
        y: 542
        width: 238
        height: 40
        text: qsTr("Reset completo")
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 18
        font.bold: true
        font.pointSize: 18
        anchors.bottomMargin: 18
        flat: false
        highlighted: false
    }

    Rectangle {
        id: rectBasi
        x: 511
        y: 392
        width: 200
        height: 152
        color: "#ffffff"

        Text {
            id: textBasi
            text: qsTr("Basi")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 20
            font.bold: true
            anchors.leftMargin: 3
            anchors.topMargin: 3
        }

        Base {
            id: base2
            x: 77
            y: 35
            width: 50
            height: 50
            rotation: 45
            state: "libera"
        }

        Base {
            id: base3
            x: 37
            y: 76
            width: 50
            height: 50
            state: "libera"
            rotation: 45
        }

        Base {
            id: base1
            x: 117
            y: 76
            width: 50
            height: 50
            state: "libera"
            rotation: 45
        }
    }
}
