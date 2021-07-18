import QtQuick 2.15
import "."

Rectangle {
    border.color: Constants.amber
    border.width: 1
    radius: 2
    default property alias contents: clientArea.children

    Item {
        id: clientArea
        anchors.fill: parent
        anchors.margins: 1
    }
}
