import QtQuick 2.12
import QtQuick.Window 2.12
import TemPad 1.0

import "imports/TemPad/perlin.js" as Noise


Window {
    readonly property real scaleFactor: 2.64
    readonly property int _unit: Constants.dims.squareDim
    readonly property var _size: Qt.vector2d(Constants.dims.squaresWidth, Constants.dims.squaresHeight)
    width: 800
    height: 480
    visible: true
    title: qsTr("TemPad")
    color: "black"


    Item {
        id: wrapper
        anchors.fill: parent
        scale: scaleFactor

        Base {
            id: screen
            anchors.centerIn: parent
            onArrow: statusVisible = !statusVisible
            //visible: false

            Frame {
                id: timelineStatus
                x: 2 * _unit
                y: 1 * _unit
                width: (_size.x - 3) * _unit + 1
                height: (_size.y - 3) * _unit + 2
                opacity: 0.9

                Item {
                    id: warningScroll
                    clip: true
                    anchors { left: parent.left; right: parent.right; top: parent.top; topMargin: 3 }
                    height: 12

                    Row {
                        height: parent.height
                        spacing: _unit * 2.5
                        NumberAnimation on x {
                            loops: Animation.Infinite
                            from: 0
                            to: -1000
                            duration: 100000
                        }

                        Repeater {
                            model: 10
                            PadText {
                                text: "REDLINE IMMINENT"
                                font.pixelSize: 12
                                color: "red"
                            }
                        }
                    }
                }



                Rectangle {
                    id: redBar
                    property int flash: 0
                    NumberAnimation on flash {
                        loops: Animation.Infinite
                        from: 0
                        to: 1
                        duration: 750
                    }
                    anchors { top: warningScroll.bottom;  topMargin: 3; left: parent.left; right: parent.right;  }
                    height: _unit - 1
                    color: "red"
                    visible: flash > 0
                }

                Canvas {
                    id: graph
                    anchors {
                        left: parent.left;
                        right: parent.right
                    }
                    y: _unit * 3; height: _unit * 9
                    contextType: "2d"

                    NumberAnimation on time {
                        from: 0.0
                        to: 100.0
                        duration: 1000000
                        loops: Animation.Infinite
                    }

                    property real time: 0.0
                    function curveY(x, y) {
                        var result = Noise.perlin2(x, y);
                        result = result * 2 + 7
                        result = result * _unit;
                        return result ;
                    }

                    Timer {
                        interval: 16
                        running: true
                        repeat: true
                        onTriggered: graph.requestPaint()
                    }


                    Path {
                        id: myPath
                        startX: 0; startY: 7*_unit
                        PathCurve { x: 5 * _unit; y: graph.curveY(5, graph.time); }
                        PathCurve { x: 10 * _unit; y: graph.curveY(10, graph.time); }
                        PathCurve { x: 15 * _unit; y: 7 * _unit; }
                        PathCurve { x: 20 * _unit; y: graph.curveY(20, graph.time); }
                        PathCurve { x: 25 * _unit; y: graph.curveY(25, graph.time); }
                        PathCurve { x: 30 * _unit; y: graph.curveY(30, graph.time); }
                    }

                    Path {
                        startX: 0; startY: _unit * 5
                        PathCubic {
                            x: 180; y: 0
                            control1X: -10; control1Y: 90
                            control2X: 210; control2Y: 90
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, width, height);
                        context.strokeStyle = Qt.rgba(.4,.6,.8);
                        context.path = myPath;
                        context.stroke();
                    }
                }


                PadText {
                    id: timeUnits
                    anchors { left: parent.left; leftMargin: 2; top: redBar.bottom; topMargin: 3 }
                    text: "3.06"
                    font.pixelSize: 12
                }


                PadText {
                    id: tmag
                    anchors { bottom: tseg.top; left: parent.left; margins: 1 }
                    text: "TIMELINE MAG: 03.55.0671.1122"
                    font.pixelSize: 5
                    color: "white"
                    font.letterSpacing: 0.8
                }
                PadText {
                    id: tseg
                    anchors { bottom: parent.bottom; left: parent.left; margins: 1; }
                    text: "TIMELINE SEGMENT: 616.432"
                    font.pixelSize: 5
                    color: "white"
                    font.letterSpacing: 0.8
                }
                PadText {
                    anchors { bottom: parent.bottom; bottomMargin: 1; right: parent.right; rightMargin: _unit * 3; }
                    text: "906.20··"
                    font.pixelSize: 5
                    color: "white"
                }
            }


            Frame {
                visible: false
                id: screen1
                width: (Constants.dims.squaresWidth - 8) * Constants.dims.squareDim
                height: 5 * Constants.dims.squareDim
                opacity: 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                y: 5.5 * Constants.dims.squareDim
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
