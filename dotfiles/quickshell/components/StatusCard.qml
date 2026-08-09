import QtQuick
import Quickshell.Services.UPower
import ".."

Row {
    Network {}
    
    Separator {}

    Battery {
        visible: UPower.displayDevice.isLaptopBattery
    }

    Separator {
        visible: UPower.displayDevice.isLaptopBattery
    }
 
    Clock {}

    spacing: Theme.spacing
}
