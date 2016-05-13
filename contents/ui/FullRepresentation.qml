import QtQuick 2.1
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras


Item {
    Label {
        id: lbl
        anchors.top: parent.top
        text: label
    }

    Button {
        width: parent.width
        anchors.top: lbl.bottom
        text: 'Open tt-rss'
        onClicked: {
            logic.open()
        }
    }
}
