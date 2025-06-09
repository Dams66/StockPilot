import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../component"
import StockPilot 1.0

Item {
    property StackView stackViewRef
    property var environment

    // Rectangle {
    //     anchors.fill: parent
    //     color: "black"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Environnement : " + environment.name +
                      " (" + environment.dimX + " x " + environment.dimY + " x " + environment.dimZ + ")"
            }

            EnvView{
                dimX: environment.dimX
                dimY: environment.dimY
                dimZ: environment.dimZ
            }

            Button {
                text: "Retour"
                onClicked: stackViewRef.pop()
            }
        }
    // }
}
