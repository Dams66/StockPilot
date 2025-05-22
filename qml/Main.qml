import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "pages"

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "StockPilot"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "pages/SplashScreen.qml"
        onLoaded: {
            pageLoader.item.finished.connect(showHome)
        }
    }

    function showHome() {
        pageLoader.source = "pages/HomePage.qml"
    }
}
