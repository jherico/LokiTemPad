import QtQuick 2.15
import "."

Rectangle {
    id: root
    default property alias contents: clientArea.children
    property alias statusText: statusText.text
    property alias rightSatusText: rightStatusText.text
    property bool statusVisible: true
    color: "black"
    width: Constants.dims.screenWidth
    height: Constants.dims.screenHeight

    signal arrow()
    signal offset()
    signal diag()
    signal crosshair()
    signal rss()

    Rectangle {
        id: frame

        anchors.fill: parent
        anchors.margins: 1
        border.color: Constants.colors.brightAmber;
        border.width: 1
        radius: 1
        color: "black"

        Item {
            id: backgroundGrid
            anchors.fill: parent
            anchors.margins: 2
            Column {
                id: grid
                spacing: -1
                Repeater {
                    model: root.statusVisible ? 16 : 17
                    Row {
                        spacing: -1
                        Repeater {
                            model: 33
                            Rectangle {
                                color: "black"
                                border.width: 0.5
                                height: 10
                                width: 10
                                border.color: Constants.colors.darkestAmber
                            }
                        }
                    }
                }
            }

        }


        Icons {
            y: 6 * Constants.dims.squareDim + 2;
            x: 2
            onArrow: root.arrow()
            onOffset: root.offset()
            onDiag: root.diag()
            onCrosshair: root.crosshair()
            onRss: root.rss()
        }

        Item {
            id: status
            height: Constants.dims.squareDim;
            visible: root.statusVisible
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom; leftMargin: 2; bottomMargin: 1; rightMargin: 1 }

            PadText {
                id: statusText
                text: "04.12.1985     8021.199 // 1122.991"
                anchors.verticalCenter: parent.verticalCenter
            }

            Row {
                anchors { right: parent.right; }
                height: parent.height
                layoutDirection: Qt.RightToLeft
                PadText {
                    id: rightStatusText
                    text: "E:90.5Gc"
                    font.pixelSize: 8
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Item {
            id: clientArea
            anchors.fill: parent
            anchors.margins: 2
        }

        Frame {
            id: logo
            z: 10
            width: (root.statusVisible ? 4 : 7) * Constants.dims.squareDim + 1
            height: (root.statusVisible ? 2 : 3) * Constants.dims.squareDim + 1
            y: (14 * Constants.dims.squareDim) + 1
            anchors {
                right: parent.right; bottom: backgroundGrid.bottom;
                rightMargin: 2; bottomMargin: statusVisible ? Constants.dims.squareDim : 0
            }
            border.color: Constants.colors.darkestAmber
            radius: 0

            Image {
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.fill: parent
                source: "images/TimeVarianceAuthorityLogo.png"
                fillMode: Image.Stretch
            }
        }

    }
}
