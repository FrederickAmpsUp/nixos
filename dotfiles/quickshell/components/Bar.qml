import QtQuick
import Quickshell

import ".."

PanelWindow {
    anchors.left: true
    anchors.right: true
    
    implicitHeight: 1.75*Theme.fontSize
    Rectangle {
        anchors.fill: parent
        color: Theme.background

        Workspaces {
            anchors.left: parent.left
            anchors.leftMargin: Theme.spacing
            anchors.verticalCenter: parent.verticalCenter
        }

        StatusCard {
            anchors.right: parent.right
            anchors.rightMargin: Theme.spacing
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
