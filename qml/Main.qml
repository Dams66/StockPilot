import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "pages"

ApplicationWindow {
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    title: "StockPilot"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "pages/SplashScreen.qml"
        onLoaded: {
            if (pageLoader.item && pageLoader.item.finished)
                pageLoader.item.finished.connect(showHome)
        }
    }

    function showHome() {
        pageLoader.source = "pages/HomePage.qml"
    }
}
