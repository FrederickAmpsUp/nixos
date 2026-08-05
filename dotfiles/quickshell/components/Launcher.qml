import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

import ".."

PanelWindow {
    id: launcher

    Process {
        id: fzf

        command: ["fzf", `--filter=${search.text.toLowerCase().trim()}`]

        stdout: StdioCollector {
            id: fzfOutput

            onStreamFinished: {
                let lines = fzfOutput.text.split(/\r?\n/)

                const id_first = lines[0].split(" ")[0]
                const entry_first = DesktopEntries.byId(id_first)
                const name_first = entry_first ? entry_first.name : ""

                const query = search.text.toLowerCase();

                const starts_with_id = id_first.toLowerCase().startsWith(query)
                const starts_with_name = name_first.toLowerCase().startsWith(query)

                if (search.text.trim() && entry_first && (starts_with_id || starts_with_name)) {
                    lines.shift();
                    completion.text =
                        starts_with_name ?
                        name_first.slice(search.text.length) :
                        id_first.slice(search.text.length)
                    completion.x = search.contentWidth;
                    completion.visible = true;
                } else {
                    completion.visible = false;
                }

                for (const line of lines) {
                    const id = line.split(" ")[0];
                    const entry = DesktopEntries.byId(id.trim())
                    if (entry) {
                        // TODO: build a list of suggested apps
                    }
                }
            }
        }

        stdinEnabled: true

        onStarted: {
            for (const app of DesktopEntries.applications.values) {
                write(app.id + " " + app.name + "\n")
            }

            fzf.stdinEnabled = false
            fzf.stdinEnabled = true
        }
    }

    property bool visible_: false

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    color: "transparent"
    visible: visible_

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    Rectangle {
        width: 600
        implicitHeight: 1.75 * search.implicitHeight

        anchors.centerIn: parent

        color: Theme.background

        TextInput {
            id: search

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: Theme.spacing

            color: Theme.foreground
            font.pixelSize: Theme.fontSize

            focus: launcher.visible_

            Text {
                anchors.fill: parent
                text: "What are we doing today?"
                color: Qt.darker(Theme.foreground, 1.5)
                font: parent.font
                visible: !search.text
            }

            Text {
                id: completion

                x: 0
                y: 0

                text: ""
                color: Qt.darker(Theme.foreground, 1.5)
                font: parent.font
                visible: false
            }
            
            onTextChanged: {
                fzf.running = false
                fzf.running = true
                // onStreamFinished will handle results
            }

            onAccepted: {
                const id = fzfOutput.text.trim().split(" ")[0]

                const entry = DesktopEntries.byId(id)
                if (entry) {
                    entry.execute()
                    launcher.visible_ = false
                    completion.visible = false
                }
            }

            Keys.onEscapePressed: {
                launcher.visible_ = false
            }
        }
    }

    IpcHandler {
        target: "launcher"

        function toggle(): void {
            launcher.visible_ = !launcher.visible_

            if (launcher.visible_) {
                search.text = ""
                search.forceActiveFocus()
                completion.visible = false
            }
        }
    }
}
