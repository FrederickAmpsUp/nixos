import QtQuick
import Quickshell.Services.UPower
import ".."

Row {
    Battery {
        visible: UPower.displayDevice.isLaptopBattery
    }
    Clock {}

    spacing: Theme.spacing
}
