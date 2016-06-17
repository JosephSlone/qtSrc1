import QtQuick 2.6

Item {
    id: rootRow
    width: rootWindow.width
    height: rootWindow.height / 7

    property alias text: textitem.text
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#212126"
        visible: mouse.pressed
    }

    Rectangle {
        id: imageItem
        color: "#212126"
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        height: rootRow.height - 25
        width: rootRow.height - 25
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
        font.pointSize: rootRow.height/6
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
        onClicked: rootRow.clicked()

    }
}
