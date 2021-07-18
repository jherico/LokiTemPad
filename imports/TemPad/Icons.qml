import QtQuick 2.15

Column {
    id: icons
    x: 0
    y: 6 * 9
    spacing: 8

    signal arrow()
    signal offset()
    signal diag()
    signal crosshair()
    signal rss()

    Rectangle {
        width: 10; height: 10; color: "black"
        Image {
            anchors.fill: parent; smooth: false
            source: Constants.icons.arrow
            MouseArea { anchors.fill: parent; onClicked: icons.arrow() }
        }
    }

    Rectangle {
        width: 10; height: 10; color: "black"
        Image {
            anchors.fill: parent; smooth: false
            source: Constants.icons.offset
            MouseArea { anchors.fill: parent; onClicked: icons.offset() }
        }
    }
    Rectangle {
        width: 10; height: 10; color: "black"
        Image {
            anchors.fill: parent; smooth: false
            source: Constants.icons.diag
            MouseArea { anchors.fill: parent; onClicked: icons.diag() }
        }
    }
    Rectangle {
        width: 10; height: 10; color: "black"
        Image {
            anchors.fill: parent; smooth: false
            source: Constants.icons.crosshair
            MouseArea { anchors.fill: parent; onClicked: icons.crosshair() }
        }
    }
    Rectangle {
        width: 10; height: 10; color: "black"
        Image {
            anchors.fill: parent; smooth: false
            source: Constants.icons.rss
            MouseArea { anchors.fill: parent; onClicked: icons.rss() }
        }
    }
}
