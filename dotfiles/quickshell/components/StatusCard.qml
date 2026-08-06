import QtQuick
import Quickshell.Services.UPower
import ".."

Row {
    Network {}
    
    Separator {}

    Battery {
        visible: UPower.displayDevice.isLaptopBattery
    }

    Separator {}
 
    Clock {}

    spacing: Theme.spacing
}
