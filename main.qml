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

        Rectangle {
            id: screen
            color: "black"
            anchors.centerIn: parent
            width: Constants.dims.screenWidth
            height: Constants.dims.screenHeight
            Rectangle {
                id: screenFrame
                anchors.fill: parent
                anchors.margins: 1
                border.color: "orange"
                border.width: 1
                radius: 1
                color: "black"
                Item {
                    id: clientArea
                    anchors.fill: parent
                    anchors.margins: 2

                    Row {
                        id: grid
                        property bool statusVisible: true
                        spacing: -1
                        Repeater {
                            model: 33
                            Column {
                                spacing: -1
                                Repeater {
                                    model: 16
                                    Rectangle {
                                        color: "black"
                                        border.width: 0.5
                                        height: 10
                                        width: 10
                                        border.color: Constants.colors.darkestAmber
                                    }
                                }
                                Rectangle {
                                    color: "black"
                                    border.width: 0.5
                                    height: 10
                                    width: 10
                                    border.color: Constants.colors.darkestAmber
                                    visible: !grid.statusVisible
                                }
                            }
                        }
                    }


                    Column {
                        x: 0
                        y: 6 * 9
                        spacing: 8

                        Image {
                            width: 10
                            height: 10
                            smooth: false
                            source: Constants.icons.arrow
                            MouseArea {
                                anchors.fill: parent
                                onClicked: grid.statusVisible = !grid.statusVisible
                            }
                        }

                        Image {
                            smooth: false
                            width: 10
                            height: 10
                            source: Constants.icons.offset
                        }

                        Image {
                            smooth: false
                            width: 10
                            height: 10
                            source: Constants.icons.diag
                        }

                        Image {
                            smooth: false
                            width: 10
                            height: 10
                            source: Constants.icons.crosshair
                        }

                        Image {
                            smooth: false
                            width: 10
                            height: 10
                            source: Constants.icons.rss
                        }
                    }

                    Item {
                        id: status
                        visible: grid.statusVisible
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -1
                        height: 9
                        width: parent.width
                        Text {
                            text: "04.12.1985     8021.199 // 1122.991"
                            color: Constants.colors.amber
                            font.family: Constants.fontFamily
                            font.pixelSize: 9
                            font.capitalization: Font.AllUppercase
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Item {
                        id: rightStatus
                        visible: grid.statusVisible
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -1
                        anchors.right: parent.right
                        height: 9
                        width: rightText.width
                        Text {
                            id: rightText
                            text: "E: 90.5Gc"
                            color: Constants.colors.amber
                            //horizontalAlignment: Text.AlignLeft
                            font.family: Constants.fontFamily
                            font.pixelSize: 8
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }

/*
        Item {
            id: clientArea
            anchors.centerIn: parent
            scale: scaleFactor
            width: Constants.dims.clientWidth
            height: Constants.dims.clientHeight

            Rectangle {
                id: frame
                anchors.fill: parent
                anchors.margins: 1
                border.color: Constants.colors.darkAmber
                border.width: 5
                radius: 1
                color: "black"


            Row {
                spacing: -1
                Repeater {
                    model: 33
                    Column {
                        spacing: -1
                        Repeater {
                            model: 16
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
    }
    */
}
