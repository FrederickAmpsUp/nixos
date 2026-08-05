import QtQuick
import Quickshell

StyledText {
    SystemClock {
        id: clock
        precision: SystemClock.seconds
    }

    text: Qt.formatDateTime(clock.date, "hh:mm:ss")
}
