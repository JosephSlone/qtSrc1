import QtQuick 2.6

Item {
    id: root
    width: parent.width
    height: 256 + 10

    property alias text: textitem.text
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#11ffffff"
        visible: mouse.pressed
    }

    Image {
        id: imageItem
        anchors.left: parent.left
        anchors.leftMargin: 30
        source: icon
        height: 256
        width: 256
    }

    Text {
        id: textitem
        color: "white"
        font.pointSize:  38
        //text: modelData
        text: title
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: imageItem.right
        anchors.leftMargin: 30
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 15
        height: 1
        color: "#424246"
    }

    Image {
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "images/navigation_next_item.png"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()

    }
}
