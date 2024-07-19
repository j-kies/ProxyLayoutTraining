import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 2 - Passing Properties")

    ColumnLayout {
        id: columnMainLayout
        anchors.fill: parent
        visible: root.width < 450
        spacing: 0

        LayoutItemProxy {
            target: cat
        }

        LayoutItemProxy {
            Layout.fillWidth: true
            Layout.preferredHeight: 100

            target: navigationContainer
        }
    }

    RowLayout {
        id: rowMainLayout
        anchors.fill: parent
        visible: root.width >= 450
        spacing: 0

        LayoutItemProxy {
            Layout.fillHeight: true
            Layout.preferredWidth: 100

            target: navigationContainer
        }

        LayoutItemProxy {
            target: cat
        }
    }

    Image {
        id: cat

        Layout.fillHeight: true
        Layout.fillWidth: true

        fillMode: Image.PreserveAspectCrop
        source: "https://images.pexels.com/photos/20787/pexels-photo.jpg"
    }

    Rectangle {
        id: navigationContainer

        color: "#4646be"

        RowLayout {
            id: navigationRowLayout
            visible: columnMainLayout.visible
            anchors.fill: parent

            LayoutItemProxy {
                Layout.fillHeight: true
                Layout.preferredWidth: 80
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                target: homeButton
            }

            LayoutItemProxy {
                Layout.fillHeight: true
                Layout.preferredWidth: 80
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                target: settingsButton
            }
        }

        ColumnLayout {
            id: navigationColumnLayout
            visible: rowMainLayout.visible
            anchors.fill: parent

            LayoutItemProxy {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                target: homeButton
            }

            LayoutItemProxy {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                target: settingsButton
            }

            Item {
                Layout.fillHeight: true
            }
        }

        Button {
            id: homeButton
            flat: true
            text: String.fromCharCode(0x2302)
            font.pixelSize: 20
        }

        Button {
            id: settingsButton
            flat: true
            text: String.fromCharCode(0x2699)
            font.pixelSize: 20
        }
    }
}
