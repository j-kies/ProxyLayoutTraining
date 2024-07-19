import QtQuick
import QtQuick.Layouts

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 5 - Adjustable card")

    AdjustableCard {
        id: card

        anchors {
            fill: parent
            margins: 40
        }

        imageSource: "qrc:/qt/qml/Example5/AdjustableCard/assets/sky6.jpg"
        title: "Hello there!"
    }
}
