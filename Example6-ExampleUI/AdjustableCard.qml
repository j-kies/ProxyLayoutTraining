import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Pane {
    id: root

    property alias title: titleLabel.text
    property alias message: instructionsText.text
    property alias sourceImage: instructionImage.source

    Material.elevation: 15

    implicitWidth: 600

    Label {
        id: titleLabel
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 10
        }

        color: "black"
        verticalAlignment: Label.AlignVCenter
        font {
            pixelSize: 20
            bold: true
        }
    }

    StackLayout {
        id: stack
        visible: root.width < 500
        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 15
        }

        LayoutItemProxy {
            target: instructionsText

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        LayoutItemProxy {
            target: instructionImage

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    RowLayout {
        id: row
        visible: root.width >= 500
        spacing: 20
        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 15
        }

        LayoutItemProxy {
            target: instructionsText

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
            Layout.horizontalStretchFactor: 1
        }

        Rectangle {
            id: separator

            Layout.fillHeight: true
            Layout.preferredWidth: 1
            color: "#4646be"
        }

        LayoutItemProxy {
            target: instructionImage
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 250
            Layout.horizontalStretchFactor: 2

            Layout.maximumWidth: instructionImage.height
        }
    }

    Text {
        id: instructionsText
        text: "Some instructions on how to do stuff. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        wrapMode: Text.Wrap
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    Image {
        id: instructionImage
        fillMode: Image.PreserveAspectFit
    }

    RoundButton {
        id: nextButton
        anchors {
            bottom: parent.bottom
            right: parent.right
            margins: 2
        }

        visible: stack.visible

        width: 50
        height: 50

        text: ">"

        onClicked: {
            if (stack.currentIndex === 1) {
                stack.currentIndex = 0
            } else {
                stack.currentIndex = 1
            }
        }
    }
}
