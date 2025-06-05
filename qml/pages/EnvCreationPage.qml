import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import StockPilot 1.0

Item {
    property StackView stackViewRef

    Rectangle {
        anchors.fill: parent
        color: "white"

        Column {
            anchors.centerIn: parent
            spacing: 20

            TextField {
                id: envNameField
                placeholderText: "Entrez le nom de l'environnement"
                width: parent.width * 0.8
            }

            Button {
                text: "Enregistrer le nom"
                onClicked: {
                    console.log("Nom saisi:", envNameField.text)
                    var index = EnvManager.createEnvironment(3,3,3,envNameField.text)
                    console.log("Nouveau StockEnv à l'index:", index)
                }
            }

            Button {
                text: "Retour"
                onClicked: stackViewRef.pop()
            }
        }
    }
}
