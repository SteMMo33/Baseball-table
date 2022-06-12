import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2


ApplicationWindow {
    id: root
    visible: true

    width: 900
    height: 600
    title: qsTr("Baseball Table")

    property color colorHome: "#ccffff"
    property color colorVisitor: "#ffccff"

    property string nameHome: "SALA BAGANZA Ermes Fontana B.C."
    property string nameVisitor: "visit"

    property int strike: 0
    property int ball: 0
    property int out: 0
    property int topBottom: 0
    property int inning: 1


    MainForm {

        anchors.fill: parent

       // -- STRIKE
        upDownStrike.onPressedUp: {
            strike += 1
            if (strike >= 3){
                strike = 0
                ball = 0
                out += 1
                checkCambio()
            }
        }

        upDownStrike.onPressedDown: {
            console.log("Strk-")
            if (strike > 0) strike -= 1;
        }

        upDownBall.onPressedUp: {
            console.log("Ball+")
            ball += 1
            if (ball >= 4){
                strike = 0
                ball = 0
            }
        }

        upDownBall.onPressedDown: {
            console.log("Ball-")
            if (ball > 0) ball -= 1
        }

        // -- OUT
        upDownOut.onPressedUp: {
            console.log("Out+")
            out += 1
            checkCambio()
        }

        upDownOut.onPressedDown: {
            console.log("Out-")
            if (out > 0) out -= 1
        }

        // -- HOME

        textInputHome.onFocusChanged: {
            console.log("Focus h: "+focus);
            if(focus) textInputHome.selectAll()
        }

        textInputHome.onTextChanged: {
            console.log("TxtHomeChanged")
            nameHome = textInputHome.text
        }


        // -- VISITOR

        textInputVisitor.onFocusChanged: if(focus) textInputVisitor.selectAll()
        textInputVisitor.onTextChanged: {
            console.log("TxtVisChang")
            nameVisitor = textInputVisitor.text
        }

        // -- INNING
        upDownInning.onPressedUp: {
            inning += 1
        }

        upDownInning.onPressedDown: {
            inning -= 1
        }

        buttonReset.onClicked: messageDialog.show("Sicuro di voler cancellare tutto ?")

        mouseAreaColorHome.onClicked: {
            console.log("ColorHome")
            colorDialog.open()
            rectColorHome.color = colorDialog.color
            colorHome = colorDialog.color
        }

        mouseAreaColorVisitor.onClicked: {
            console.log("ColorVisit")
            colorDialog.open()
            rectColorVisitor.color = colorDialog.color
            colorVisitor = colorDialog.color
        }
    }


    function checkCambio(){
        if (out >= 3){
            strike = 0
            ball = 0
            if (topBottom==0)
                topBottom = 1
            else {
                topBottom = 0;
                inning += 1;
            }
            out = 0
        }
    }


    MessageDialog {
        id: messageDialog
        title: qsTr("Baseball Table")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    ColorDialog {
        id: colorDialog
        visible: false
        title: "Please choose a color"
        onAccepted: {
            console.log("You chose: " + colorDialog.color)
            // Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            // Qt.quit()
        }
        // Component.onCompleted: visible = true
    }


    BaseballTable {
        homeColor : colorHome
        homeName: nameHome

        visitorColor: colorVisitor
        visitorName: nameVisitor

        conteggioText: ball+" - "+strike

        outText: out + " out"

        inningText: inning
        topBottomText: if (topBottom==0) return "TOP"; else return "BOT";
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
