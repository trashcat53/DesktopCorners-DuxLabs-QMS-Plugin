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
        label: "Radius"
        description: "Size of the rounded corners"
        defaultValue: 15
        minimum: 0
        maximum: 128
        unit: "px"
    }

    ColorSetting {
        settingKey: "cornerColor"
        label: "Color"
        description: "Color of the rounded corners"
        defaultValue: "#000000"
    }

    ToggleSetting {
        settingKey: "aboveFullscreen"
        label: "Show Over Fullscreen Windows"
        description: "Off draws below fullscreen windows"
        defaultValue: true
    }
}