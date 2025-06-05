import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "pages"

ApplicationWindow {
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    title: "StockPilot"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: SplashScreen {
            onFinished: {
                stackView.push("pages/HomePage.qml",{ stackViewRef: stackView })
            }
        }
    }
}
