import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 3 - RTL")

    LayoutMirroring.enabled: modeSwitch.checked
    LayoutMirroring.childrenInherit: true

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        visible: root.width < 500

        Item {
            id: topSpacer
            Layout.fillHeight: true
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: englishLabel
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: modeSwitch
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: arabicLabel
        }

        Item {
            id: bottomSpacer
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        visible: root.width >= 500

        Item {
            id: leftSpacer
            Layout.fillWidth: true
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: englishLabel
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: modeSwitch
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: arabicLabel
        }

        Item {
            id: rightSpacer
            Layout.fillWidth: true
        }
    }

    Text {
        id: englishLabel
        text: qsTr("English")
        font.pixelSize: 24
    }

    Text {
        id: arabicLabel
        text: qsTr("اَلْعَرَبِيَّةُ")
        font.pixelSize: 24
    }

    Switch {
        id: modeSwitch
        checked: false
    }
}
