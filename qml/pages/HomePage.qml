import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import StockPilot 1.0


Item {
    id: home

    width: parent?.width || 800
    height: parent?.height || 600

    property StackView stackViewRef

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
                            stackViewRef.push("EnvCreationPage.qml", {stackViewRef: stackViewRef})
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

                ListView {
                    anchors.fill: parent
                    model: EnvManager.environments
                    delegate: Rectangle {
                        height: 40
                        width: parent.width
                        color: index % 2 === 0 ? "#ddd" : "#eee"

                        Text {
                            text: modelData.name
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            font.pixelSize: 14
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Item cliqué :", modelData.name)
                                stackViewRef.push("EnvManagement.qml", {
                                    stackViewRef: stackViewRef,
                                    environment: modelData
                                })
                            }
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                }
            }
        }
    }
}
