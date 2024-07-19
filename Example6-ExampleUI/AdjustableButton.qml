import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

AbstractButton {
    id: root

    background: Rectangle {
        color: "#4646be"
        radius: 15
    }

    implicitHeight: 85
    implicitWidth: 300

    icon.width: 30
    icon.height: 30
    icon.color: "white"

    topPadding: 5
    bottomPadding: 5
    leftPadding: 20
    rightPadding: 20

    contentItem: Item {
        id: contentWrapper
        anchors.fill: parent
        opacity: root.down ? 0.5 : 1.0

        RowLayout {
            id: row

            anchors {
                fill: parent
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
            }

            visible: root.width >= 250

            LayoutItemProxy {
                target: iconObj
                Layout.alignment: Qt.AlignHCenter
            }

            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            id: column

            anchors {
                fill: parent
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
            }

            visible: root.width <= 250 && root.height >= 80

            LayoutItemProxy {
                target: iconObj
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        ColumnLayout {
            id: textOnlyLayout

            anchors {
                fill: parent
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
            }

            visible: root.width <= 250 && root.height < 80

            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        IconLabel {
            id: iconObj
            icon: root.icon
            display: IconLabel.IconOnly
        }

        Text {
            id: textObj
            text: root.text
            color: icon.color
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            elide: Text.ElideRight
        }
    }
}
