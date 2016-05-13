import QtQuick 2.1

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

import "../code/script.js" as Logic

Item {
    property var logic: Logic
    property var label: 'Not connected'

    Timer {
        id: wsReconnectTimer
        interval: Logic.getUpdateInterval()
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            Logic.requestFeedCount()
        }
    }
    //  Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}

    Component.onCompleted: {
        plasmoid.status = PlasmaCore.Types.PassiveStatus;
    }
}
