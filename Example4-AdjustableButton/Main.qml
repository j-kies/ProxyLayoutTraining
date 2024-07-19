import QtQuick
import QtQuick.Layouts

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 4 - Adjustable button")

    RowLayout {
        id: mainLayout
        anchors.fill: parent

        AdjustableButton {
            id: reactiveButton
            Layout.maximumHeight: 80
            Layout.maximumWidth: 300
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            text: "Hello there!"
            icon.source: "qrc:/qt/qml/Example4/AdjustableButton/assets/arrow-circle-right-svgrepo-com.svg"
        }
    }
}
