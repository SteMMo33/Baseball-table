import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id: main
    width: 900
    height: 600
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
            text: qsTr("Baseball Table")
            font.pixelSize: 60
            font.family: "Arial"
            font.bold: true
        }
    }

    RowLayout {
        id: rowHomeVisitor
        y: 85
        anchors.left: parent.left
        anchors.top: rowTitle.bottom
        anchors.leftMargin: 25
        anchors.topMargin: 29

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100

            RowLayout {
                id: rowLayoutVisitor
                width: 100
                height: 100

                Text {
                    id: textVisitor
                    text: qsTr("Visitor")
                    font.pixelSize: 30
                    Layout.rightMargin: 15
                    font.bold: true
                }

                TextInput {
                    id: textInputVisitor
                    width: 80
                    height: 20
                    color: "#433aff"
                    text: nameVisitor
                    font.pixelSize: 30
                    selectByMouse: true
                    padding: 2
                    rightPadding: 20
                    leftPadding: 20
                }

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
            }

            RowLayout {
                id: rowLayoutHome
                width: 100
                height: 100

                Text {
                    id: textHome
                    text: qsTr("Home")
                    font.pixelSize: 30
                    Layout.rightMargin: 20
                    font.bold: true
                }

                TextInput {
                    id: textInputHome
                    width: 80
                    height: 20
                    color: "#433aff"
                    text: nameHome
                    font.pixelSize: 30
                    focus: true
                    cursorVisible: true
                    rightPadding: 20
                    leftPadding: 20
                    selectByMouse: true
                }

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
                id: upDownInning1
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
        y: 520
        width: 416
        height: 40
        text: qsTr("Reset completo")
        anchors.bottom: parent.bottom
        font.bold: true
        font.pointSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 40
        flat: false
        highlighted: false
    }

    UpDown {
        id: upDownPunti
        x: 762
        y: 464
        width: 54
        height: 128
        textDataText: "0"
    }
}
