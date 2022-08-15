import QtQuick 2.0

Item {
    id: base

    signal pressed


    Rectangle {
        id: rectangle
        color: "#ffffff"
        radius: 5
        border.width: 2
        anchors.fill: parent
        state: ""
        rotation: 0

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: base.pressed()
        }
    }
    states: [
        State {
            name: "occupata"

            PropertyChanges {
                target: rectangle
                color: "#fcffc3"
            }
        },
        State {
            name: "libera"

            PropertyChanges {
                target: rectangle
                color: "#ffffff"
            }
        }
    ]

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:200;width:200}
}
##^##*/
