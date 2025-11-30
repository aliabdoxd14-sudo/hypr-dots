import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 120
    visible: true
    title: "quickshell - default placeholder"
    color: "transparent"

    Rectangle {
        id: bg
        anchors.fill: parent
        color: "#071226"
        opacity: 0.96
        radius: 8
        border.color: "#2b4a6e"
        border.width: 1
    }

    Text {
        id: msg
        anchors.centerIn: parent
        text: "Quickshell loaded — default placeholder (click to close)"
        color: "#8fc9ff"
        font.pixelSize: 14
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit()
        }
    }
}
