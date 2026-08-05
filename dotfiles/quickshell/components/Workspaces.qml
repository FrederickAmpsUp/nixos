import QtQuick
import Quickshell
import Quickshell.Hyprland

import ".."

Row {
    spacing: 0

    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            required property var modelData

            width: 1.75 * Theme.fontSize
            height: 1.75 * Theme.fontSize
            radius: 6

            color: modelData.focused ? Theme.foreground : Theme.background

            StyledText {
                anchors.centerIn: parent
                text: modelData.id
                color: modelData.focused ? Theme.background : Theme.foreground
            }

            MouseArea {
                anchors.fill: parent

                onClicked: modelData.activate()
            }
        }
    }
}
