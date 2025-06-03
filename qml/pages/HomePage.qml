import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "white"

        Image {
            id: logo
            source: "qrc:/assets/LogoStockPilot.png"
            width: parent.width * 0.1
            height: width
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 20
            fillMode: Image.PreserveAspectFit
        }

        RowLayout {
            id: contentRowLayout
            anchors.top: logo.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width * 0.8
            height: parent.height * 0.7
            spacing: width * 0.1

            Rectangle {
                    Layout.preferredWidth: contentRowLayout.width * 0.45
                    Layout.fillHeight: true
                    radius: 20
                    color: "#f0f0f0"
                    border.color: "#888"
                    border.width: 2

                Column {
                    anchors.fill: parent
                    spacing: 20

                    Text {
                        text: "Créer un environnement\nde stockage"
                        wrapMode: Text.WordWrap
                        font.pixelSize: parent.width * 0.05
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                    }

                    Button {
                        id: createButton
                        width: parent.width * 0.5
                        height: width
                        anchors.horizontalCenter: parent.horizontalCenter

                        background: Rectangle {
                            color: "white"
                            radius: width / 2
                            border.color: "#888"
                            border.width: 2
                        }

                        contentItem: Item {
                            anchors.fill: parent

                            Label {
                                text: "+"
                                color: "black"
                                font.pixelSize: parent.width * 0.5
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill: parent
                            }
                        }
                        onClicked: {
                                    var index = envManager.createEnvironment()
                                    console.log("Nouveau StockEnv à l'index:", index)
                                }
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: contentRowLayout.width * 0.45
                Layout.fillHeight: true
                radius: 20
                color: "#f0f0f0"
                border.color: "#888"
                border.width: 2
            }
        }
    }
}
