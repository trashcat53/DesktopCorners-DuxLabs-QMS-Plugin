import QtQuick
import qs.Common
import qs.Modules.Plugins
import qs.Widgets

PluginSettings {
    id: root
    pluginId: "DesktopCorners"

    StyledText {
        width: parent.width
        text: "Desktop Corners Settings"
        font.pixelSize: Theme.fontSizeLarge
        font.weight: Font.Bold
        color: Theme.surfaceText
    }

    StyledText {
        width: parent.width
        text: "Configure your Desktop Corners here"
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.surfaceVariantText
        wrapMode: Text.WordWrap
    }

    StringSetting {
        settingKey: "Corner Size"
        label: "Display Text"
        description: "Text shown in the bar"
        placeholder: "Enter text"
        defaultValue: "Hello"
    }
}