import QtQuick
import Quickshell.Networking

StyledText {
    function deviceString() {
        let bestDevice = null;

        for (let device of Networking.devices.values) {
            if (!device.connected) continue;
            if (!bestDevice) { // no device selected yet, set it to this one
                bestDevice = device;
            } else {
                if (device.type == DeviceType.Ethernet)
                    bestDevice = device; // prefer Ethernet devices
            }
        }

        console.log(bestDevice);

        if (bestDevice === null) return "disconnected";

        return bestDevice.networks.values[0].name;
    }
    text: deviceString()
}
