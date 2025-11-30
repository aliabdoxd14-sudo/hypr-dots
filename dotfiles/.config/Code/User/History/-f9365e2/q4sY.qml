import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 120
    visible: false
    title: "quickshell - default placeholder"

    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    Text {
        anchors.centerIn: parent
        text: "Quickshell default placeholder"
        color: "#8fc9ff"
        font.pixelSize: 14
    }
}
