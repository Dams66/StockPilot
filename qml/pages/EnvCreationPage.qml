
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    property StackView stackViewRef
    property int envIndex: -1

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Environnement #" + envIndex
            font.pointSize: 20
        }

        Button {
            text: "Retour"
            onClicked: stackViewRef.pop()
        }
    }
}
