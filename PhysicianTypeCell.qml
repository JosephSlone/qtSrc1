import QtQuick 2.5
import QtQuick.Controls 1.4

Item {
    property alias cellColor: rectangle.color
    property alias cellText: text.text
    property alias textColor: text.color
    property alias checked: rectImage.visible
    height: 40

    Rectangle {
        id: rectangle
        height: parent.height
        width: parent.width - 15
        radius: 20
        border.width: 1
        border.color: "silver"
        Image {
            id: rectImage
            source: "images/checkmark.png"
            anchors.top: rectangle.top
            anchors.left: rectangle.left
            height: rectangle.height - 10
            width: rectangle.height - 10
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: text
            text: "Place Holder"
            color: "silver"
            font.pointSize: 14
            anchors.left: rectImage.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
