import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland
import qs.Common
import qs.Modules.Plugins

PluginComponent {
    id: root

    property int cornerRadius: pluginData.cornerRadius ?? 24
    property color cornerColor: pluginData.cornerColor ?? "#000000"
    property bool aboveFullscreen: pluginData.aboveFullscreen ?? true

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: win

            required property var modelData
            screen: modelData

            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            color: "transparent"
            exclusionMode: ExclusionMode.Ignore

            // An empty input region makes the whole overlay click-through
            mask: Region {}

            WlrLayershell.namespace: "dms:plugins:rounded-corners"
            WlrLayershell.layer: root.aboveFullscreen ? WlrLayer.Overlay : WlrLayer.Top
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            // One corner piece: a square with a quarter circle cut out.
            // Drawn as top-left, then rotated for the other three corners.
            component Corner: Shape {
                id: corner
                property int steps: 0   // quarter turns clockwise

                width: root.cornerRadius
                height: root.cornerRadius
                rotation: steps * 90
                antialiasing: true
                preferredRendererType: Shape.CurveRenderer

                ShapePath {
                    fillColor: root.cornerColor
                    strokeColor: "transparent"
                    strokeWidth: 0

                    startX: 0
                    startY: 0
                    PathLine { x: corner.width; y: 0 }
                    PathArc {
                        x: 0
                        y: corner.height
                        radiusX: corner.width
                        radiusY: corner.height
                        direction: PathArc.Counterclockwise
                    }
                    PathLine { x: 0; y: 0 }
                }
            }

            Corner { steps: 0; anchors.top: parent.top;       anchors.left: parent.left }
            Corner { steps: 1; anchors.top: parent.top;       anchors.right: parent.right }
            Corner { steps: 2; anchors.bottom: parent.bottom; anchors.right: parent.right }
            Corner { steps: 3; anchors.bottom: parent.bottom; anchors.left: parent.left }
        }
    }

    Component.onCompleted: console.info("Rounded Corners started")
}