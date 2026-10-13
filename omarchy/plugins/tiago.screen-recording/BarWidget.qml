import QtQuick
import Quickshell.Io
import qs.Ui

BarWidget {
    id: root

    moduleName: "tiago.screen-recording"

    property bool recording: false

    visible: recording
    implicitWidth: button.implicitWidth
    implicitHeight: button.implicitHeight

    function refresh() {
        if (!root.bar || statusProc.running)
            return

        statusProc.command = [
            "pgrep",
            "--quiet",
            "-f",
            "^gpu-screen-recorder"
        ]

        statusProc.running = true
    }

    Component.onCompleted: refresh()
    onBarChanged: refresh()

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: root.refresh()
    }

    Process {
        id: statusProc

        onExited: function(exitCode) {
            root.recording = exitCode === 0
        }
    }

    BarIconButton {
        id: button

        anchors.fill: parent
        bar: root.bar
        text: "󰻂"
        foreground: "#ff3333"
        tooltipText: "Parar gravação"

        onPressed: function() {
            if (root.bar && root.recording) {
                root.bar.run(
                    "omarchy-capture-screenrecording --stop-recording"
                )
            }
        }
    }
}
