import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 1 Buttons")

    ColumnLayout {
        id: column

        anchors.fill: parent
        visible: root.width < 450

        LayoutItemProxy {
            target: button1
        }

        LayoutItemProxy {
            target: button2
        }
    }

    RowLayout {
        id: row

        anchors.fill: parent
        visible: root.width >= 450

        LayoutItemProxy {
            target: button1
        }

        LayoutItemProxy {
            target: button2
        }
    }

    Button {
        id: button1
        Layout.fillHeight: true
        Layout.fillWidth: true
        text: "Hello"
    }

    Button {
        id: button2
        Layout.fillHeight: true
        Layout.fillWidth: true
        text: "World!"
    }
}
