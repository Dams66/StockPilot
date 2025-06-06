import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import StockPilot 1.0

Item {
    property StackView stackViewRef
    property var environment

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Environnement : " + environment.name +
                  " (" + environment.dimX + " x " + environment.dimY + " x " + environment.dimZ + ")"
        }

        Button {
            text: "Retour"
            onClicked: stackViewRef.pop()
        }
    }
}
