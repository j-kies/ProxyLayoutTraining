import QtQuick
import QtQuick.Layouts

Window {
    id: root

    width: 800
    height: 640
    visible: true
    title: qsTr("Example 6 - responsive UI")

    Text {
        id: appTitle

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 10
            leftMargin: 10
        }

        text: qsTr("Proxy layouts training")
        color: "black"
        verticalAlignment: Text.AlignVCenter

        //Used to ensure that text font size allows to display
        //the full text within the container
        fontSizeMode: Text.Fit
        font {
            pixelSize: 20
            bold: true
        }
    }

    RowLayout {
        id: mainLayout

        anchors {
            top: appTitle.bottom
            topMargin: 20
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        ColumnLayout {
            id: buttonsLayout
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 30

            //Buttons which automatically adjusts their layouts depending on available space
            AdjustableButton {
                id: firstButton

                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.maximumWidth: 300

                text: qsTr("Option 1")
                icon.source: "qrc:/qt/qml/Example6/ExampleUI/assets/arrow-circle-right-svgrepo-com.svg"
            }

            AdjustableButton {
                id: secondButton

                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.maximumWidth: 300

                text: qsTr("Option 2")
                icon.source: "qrc:/qt/qml/Example6/ExampleUI/assets/cloud-bolt-svgrepo-com.svg"
            }

            //AdjustableCard passed to the column layout in order to allow
            //to display it below the buttons in case where we transition from
            //horizontal to vertical mode
            LayoutItemProxy {
                target: card

                visible: root.width < 400
            }
        }

        //AdjustableCard passed to the row layout in order to allow
        //to display it on the right handside of the buttons in case where we
        //display the app in horizontal mode
        LayoutItemProxy {
            target: card
            visible: root.width >= 400
        }
    }

    //Card which auto-adjusts its layout depending on available width
    AdjustableCard {
        id: card

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.margins: 30

        title: "Hello there"
        sourceImage: "qrc:/qt/qml/Example6/ExampleUI/assets/sky6.jpg"
    }
}
