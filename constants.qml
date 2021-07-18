pragma Singleton
import QtQuick 2.6

QtObject {
    property FontLoader fontLoader: FontLoader {
        id: fontLoader
        source: "MorePerfectDOSVGA.ttf"
    }
    readonly property alias fontFamily: fontLoader.name
    readonly property color amber: "#FFB000"

    readonly property int sqW: 33
    readonly property int sqH: 16


    readonly property int width: 1024
    readonly property int height: 768
    readonly property int leftSideBarWidth: 366
    readonly property int defaultMargin: 8

}
