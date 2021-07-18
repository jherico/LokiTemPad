import QtQuick 2.15
import QtQuick.Window 2.15
import TemPad 1.0

Window {
    readonly property int scaleFactor: 4
    width: 1600
    height: 800
    visible: true
    title: qsTr("Hello World")
    color: "red"

    Item {
        id: wrapper
        anchors.fill: parent
        scale: scaleFactor

        Base {
            id: screen
            anchors.centerIn: parent

            onArrow: statusVisible = !statusVisible

            Rectangle {
                width: (Constants.dims.squaresWidth - 8) * (Constants.dims.squareSize - 1)
                height: 5 * (Constants.dims.squareSize - 1)
                anchors.horizontalCenter: parent.horizontalCenter
                y: (6 * 9) - 2
                color: "black"
                opacity: 0.9
                border.color: Constants.colors.amber
                border.width: 1
                Text {
                    text: "Initializing."
                    color: Constants.colors.brightAmber
                    font.family: Constants.fontFamily
                    font.pixelSize: 24
                    font.capitalization: Font.AllUppercase
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
