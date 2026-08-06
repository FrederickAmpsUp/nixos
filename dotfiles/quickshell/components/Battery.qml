import Quickshell.Services.UPower
import QtQuick

StyledText {
    text: `${Math.round(UPower.displayDevice.percentage * 100)}%`
}
