import QtQuick 2.0
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Layouts 1.1 as QtLayouts

Item {
    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_serverURL: serverURLField.text
    property alias cfg_serverUser: serverUserField.text
    property alias cfg_serverUpdate: serverUpdateField.text

    QtLayouts.GridLayout {
        columns: 2
        anchors.left: parent.left
        anchors.right: parent.right
        QtControls.Label {
            id: serverURLLabel
            text: i18n("Server URL")
        }
        QtControls.TextField {
            id: serverURLField
            QtLayouts.Layout.fillWidth: true
        }

        QtControls.Label {
            text: i18n("Username")
        }
        QtControls.TextField {
            id: serverUserField
        }

        QtControls.Label {
            text: i18n("Update Frequency (seconds)")
        }
        QtControls.TextField {
            id: serverUpdateField
        }
    }
}
