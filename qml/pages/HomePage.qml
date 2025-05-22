import QtQuick
import QtQuick.Controls

Item {
    width: 640
    height: 480

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Bienvenue sur StockPilot"
            font.pixelSize: 24
            font.bold: true
        }

        Button {
            text: "Commencer"
            onClicked: console.log("Navigation future ici")
        }
    }
}
