import QtQuick

import ".."

Rectangle {
    anchors.verticalCenter: parent.verticalCenter 

    width: 1
    height: Theme.fontSize
    color: Theme.foreground
    opacity: 0.5

    x: Math.round(x)

    antialiasing: true
}
