import QtQuick
import QtQuick.Controls

Item {
    id: splash
    width: parent?.width || 800
    height: parent?.height || 600

    signal finished()

    Rectangle {
        anchors.fill: parent
        color: "white"

        Image {
            id: logo
            source: "qrc:/assets/LogoStockPilot.png"
            anchors.centerIn: parent
            opacity: 0.0
            scale: 0.25
        }

        Timer {
            id: delayTimerentry
            interval: 1000
            running: true
            repeat: false
            onTriggered: entryAnim.start()
        }

        Timer {
            id: delayTimerexit
            interval: 3000
            running: false
            repeat: false
            onTriggered: exitAnim.start()
        }

        ParallelAnimation {
            id: entryAnim
            onStarted: logo.opacity = 1
            NumberAnimation { target: logo; property: "opacity"; from: 0; to: 1; duration: 600 }
            NumberAnimation { target: logo; property: "scale"; from: 0.25; to: 0.5; duration: 600; easing.type: Easing.OutBack }
            onFinished: delayTimerexit.start()
        }

        SequentialAnimation {
            id: exitAnim
            onFinished: splash.finished()
            NumberAnimation { target: logo; property: "scale"; from: 0.5; to: 0.25; duration: 400; easing.type: Easing.InBack }
            NumberAnimation { target: logo; property: "opacity"; from: 1; to: 0; duration: 400 }
            ScriptAction { script: logo.opacity = 0 }
        }
    }
}
