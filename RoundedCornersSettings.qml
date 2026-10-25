import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "roundedCorners"

    StyledText {
        width: parent.width
        text: "Rounded Corners"
        font.pixelSize: Theme.fontSizeLarge
        font.weight: Font.Bold
        color: Theme.surfaceText
    }

    SliderSetting {
        settingKey: "cornerRadius"
        label: "Corner Radius"
        description: "Size of the rounded corners"
        defaultValue: 24
        minimum: 4
        maximum: 64
        unit: "px"
    }

    ColorSetting {
        settingKey: "cornerColor"
        label: "Corner Color"
        description: "Usually black to match a bezel"
        defaultValue: "#000000"
    }

    ToggleSetting {
        settingKey: "aboveFullscreen"
        label: "Show Over Fullscreen Windows"
        description: "Off draws below fullscreen apps"
        defaultValue: true
    }
}