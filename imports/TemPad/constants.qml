pragma Singleton
import QtQuick 2.6

QtObject {
    property FontLoader fontLoader: FontLoader {
        id: fontLoader
        source: "fonts/MorePerfectDOSVGA.ttf"
    }

    readonly property alias fontFamily: fontLoader.name
    readonly property color amber: "#FFB000"
    readonly property color darkAmber: "#bf8300"
    readonly property color darkestAmber: "#7f5700"
    readonly property color brightAmber: "#ffc340"

    readonly property var colors: QtObject {
        readonly property color amber: "#FFB000"
        readonly property color darkAmber: "#bf8300"
        readonly property color darkestAmber: "#7f5700"
        readonly property color brightAmber: "#ffc340"
    }

    readonly property var icons: QtObject {
        readonly property string arrow: "images/icon_arrow.png"
        readonly property string crosshair: "images/icon_crosshair.png"
        readonly property string diag: "images/icon_diag.png"
        readonly property string offset: "images/icon_offset.png"
        readonly property string rss: "images/icon_rss.png"
    }

    readonly property var dims: QtObject {
        readonly property int squareSize: 10
        readonly property int squareDim: squareSize - 1
        readonly property int squaresWidth: 33
        readonly property int squaresHeight: 17
        readonly property int clientWidth: squaresWidth * (squareSize - 1) + 1
        readonly property int clientHeight: squaresHeight * (squareSize - 1) + 1
        readonly property int frameMargin: 3
        readonly property int screenWidth: clientWidth + (frameMargin * 2)
        readonly property int screenHeight: clientHeight + (frameMargin * 2)
    }


    readonly property int width: 340
    readonly property int height: 180
}
