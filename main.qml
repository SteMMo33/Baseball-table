import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1

Window {
    id: root
    visible: true

    width: 900
    height: 600
    title: qsTr("Baseball Table Control")

    property color colorHome: "#ccffff"
    property color colorVisitor: "#ffccff"

    property string nameHome: "SALA BAGANZA Ermes Fontana B.C."
    property string nameVisitor: "Visitor"

    property int strike: 0
    property int ball: 0
    property int out: 0
    property int topBottom: 0
    property int inning: 1
    property int nAtBatVisitor: 0
    property int nAtBatHome: 0

    //property Team teamV
    //property Team teamH

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

        // -- Basi
        base1.onPressed: switchBase(base1)
        base2.onPressed: switchBase(base2)
        base3.onPressed: switchBase(base3)


        buttonReset.onClicked: {
            messageDialog.text = "Sicuro di voler cancellare tutto ?"
            messageDialog.open()
        }

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

        mouseAreaHome.onClicked: {
            fileDialog.open()
        }

        mouseAreaVisitor.onClicked: {
            fileDialog.open()
        }
    }


    // Gestione cambio squadre
    function checkCambio(){
        if (out >= 3){
            strike = 0
            ball = 0
            if (topBottom==0){
                topBottom = 1
                baseballTable.imageBallHome = true
                baseballTable.imageBallVis = false
            }
            else {
                topBottom = 0;
                inning += 1;
                baseballTable.imageBallHome = false
                baseballTable.imageBallVis = true
            }
            out = 0
        }
    }


    MessageDialog {
        id: messageDialog
        title: qsTr("Baseball Table")
        standardButtons: StandardButton.Ok + StandardButton.Cancel
            // text: caption;
            onRejected: {
                console.log("Rejected")
            }
            onAccepted: {
                console.log("Reset Accepted")
                out = 0; inning = 1
                strike = 0; ball = 0
                topBottom = 0
            }
    }

    ColorDialog {
        id: colorDialog
        visible: false
        title: "Scegli un colore"
        onAccepted: {
            console.log("You chose: " + colorDialog.color)
        }
        onRejected: {
            console.log("Color Canceled")
        }
        // Component.onCompleted: visible = true
    }



    FileDialog {
        id: fileDialog;
          title: "Scegliere un file";
          nameFilters: ["Team Files (*.json)"];
          selectFolder: false
          // visible: true
          onAccepted: {
              console.log("User has selected " + fileDialog.fileUrl);
              fileDialog.close()
          }
    }


    BaseballTable {
        id: baseballTable
        homeColor : colorHome
        homeName: nameHome

        visitorColor: colorVisitor
        visitorName: nameVisitor

        conteggioText: ball+" - "+strike

        outText: out + " out"

        inningText: inning
        topBottomText: if (topBottom==0) return "TOP"; else return "BOT";

        imageBallHome: false
        imageBallVis: true
    }



    function switchBase(base)
    {
        console.log("base pressed")
        if (base.state==="libera"){
            base.state = 'occupata'
        }
        else {
            base.state ='libera'
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
