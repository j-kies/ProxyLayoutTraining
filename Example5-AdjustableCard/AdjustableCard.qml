import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Pane {
    id: root

    property alias text: instructionText.text
    property alias imageSource: instructionImage.source
    property alias title: titleLabel.text

    Material.elevation: 15

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

        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        visible: root.width < 500

        LayoutItemProxy {
            target: instructionText
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

        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        visible: root.width >= 500
        spacing: 20

        LayoutItemProxy {
            target: instructionText
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
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
        }
    }

    Text {
        id: instructionText
        text: "Here are some instructions on how to use the application or device. The text goes on and should be wrapped."
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
