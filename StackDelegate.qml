import QtQuick 2.6

Item {
    id: rootRow
    width: rootWindow.width
    height: rootWindow.height / 6

    property alias text: textitem.text
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#11ffffff"
        visible: mouse.pressed
    }

    Rectangle {
        id: imageItem
        color: "#424246"
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        height: rootRow.height - 15
        width: rootRow.height - 15
        Image {
            source: icon
            fillMode: Image.PreserveAspectFit
            width: imageItem.width
            height: imageItem.height
        }
    }

    Text {
        id: textitem
        color: "white"
        font.pointSize:  38
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
