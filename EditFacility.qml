import QtQuick 2.6
import QtQuick.Controls 1.5

Rectangle {
    color: "#424246"
    property int currentId

    Label {
 //       text: "Hello World"
        text: "Current ID: " + currentId
        font.pointSize: 64
        font.italic: true
        color: "white"
    }


}
