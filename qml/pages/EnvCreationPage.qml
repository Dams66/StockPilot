import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import StockPilot 1.0

Item {
    property StackView stackViewRef
    property string envName: ""
    property bool nameEntered: false
    property int step: 0 // 0 = dimXField, 1 = dimYField, 2 = dimZField

    function validateAndAdvance(field, nextField) {
        const val = parseInt(field.text)
        if (val > 0) {
            step += 1
            if (nextField) nextField.forceActiveFocus()
        } else {
            console.warn("Valeur invalide pour le champ " + field.placeholderText)
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "white"

        Column {
            anchors.centerIn: parent
            spacing: 20

            TextField {
                id: nameField
                visible: !nameEntered
                placeholderText: "Nom de l'environnement"
                Component.onCompleted: {
                    Qt.callLater(() => nameField.forceActiveFocus())
                }
                onAccepted: {
                    if (text.trim() !== "") {
                        envName = text.trim()
                        nameEntered = true
                        dimXField.forceActiveFocus()
                    }
                }
            }

            Text {
                visible: nameEntered
                text: "Nom: " + envName
                font.bold: true
                font.pointSize: 14
            }

            RowLayout {
                visible: nameEntered
                spacing: 10

                TextField {
                    id: dimXField
                    placeholderText: "Dim X"
                    validator: IntValidator { bottom: 1 }
                    inputMethodHints: Qt.ImhDigitsOnly
                    readOnly: step !== 0
                    opacity: 1.0
                    onAccepted: validateAndAdvance(dimXField, dimYField)

                    Behavior on opacity { NumberAnimation { duration: 200 } }
                }

                TextField {
                    id: dimYField
                    placeholderText: "Dim Y"
                    validator: IntValidator { bottom: 1 }
                    inputMethodHints: Qt.ImhDigitsOnly
                    readOnly: step !== 1
                    opacity: step >= 1 ? 1.0 : 0.7
                    onAccepted: validateAndAdvance(dimYField, dimZField)

                    Behavior on opacity { NumberAnimation { duration: 200 } }
                }

                TextField {
                    id: dimZField
                    placeholderText: "Dim Z"
                    validator: IntValidator { bottom: 1 }
                    inputMethodHints: Qt.ImhDigitsOnly
                    readOnly: step !== 2
                    opacity: step >= 2 ? 1.0 : 0.7
                    onAccepted: {
                        const val = parseInt(dimZField.text)
                        if (val > 0) {
                            console.log("Création de l'environnement :", dimXField.text, dimYField.text, dimZField.text, envName)
                            EnvManager.createEnvironment(dimXField.text, dimYField.text, dimZField.text, envName)
                        } else {
                            console.warn("Valeur invalide pour Z")
                        }
                    }

                    Behavior on opacity { NumberAnimation { duration: 200 } }
                }
            }

            Button {
                text: "Retour"
                onClicked: stackViewRef.pop()
            }
        }
    }
}
