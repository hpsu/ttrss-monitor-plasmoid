import QtQuick 2.1
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    function getColoredIcon(color) {
        return 'data:image/svg+xml;utf8,<svg ' +
               'xmlns="http://www.w3.org/2000/svg" width="32" height="32" ' +
               'viewBox="0 0 113.39978 113.38468"><g transform="translate(24.699891,-952.89266)"><path ' +
               'd="m 3.57,984.51 14.07,0 0,-14.14 21.5,0 0,14.14 21.29,0 0,14 -21.29,0 0,28.86 21.29,0 0,14.07 -7.14,0 0,7.36 -28.21,0 0,-7.36 -7.43,0 0,-42.93 -14.07,0 z" ' +
               'style="fill:' + String(color).replace('#', '%23') +
               ';"/></g></svg>';
    }

    Image {
        id: icon
        fillMode: Image.PreserveAspectFit
        smooth: false
        anchors.fill: parent
        sourceSize.height: this.height
        sourceSize.width: this.width
        source: getColoredIcon(myPalette.text)
    }
    MouseArea {
        anchors.fill: parent
        onClicked: Logic.open()
    }
}
