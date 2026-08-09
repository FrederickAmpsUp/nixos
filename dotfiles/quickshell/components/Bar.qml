import QtQuick
import Quickshell

import ".."
ShellRoot {
    Variants {
        // Automatically instantiates a window for every connected screen
        model: Quickshell.screens

        PanelWindow {
            // Injects each screen object into the panel
            required property var modelData
            screen: modelData

            anchors.left: true
            anchors.right: true
            anchors.top: true

            implicitHeight: 1.75*Theme.fontSize
            Rectangle {
                anchors.fill: parent
                color: Theme.background

                Workspaces {
                    screen: modelData

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

            // Bar components go here...
        }
    }
}
