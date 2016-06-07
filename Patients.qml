import QtQuick 2.0

Rectangle {

//    width: 250; height: 300
    color: "#424246"


    Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth
            height: grid.cellHeight
            Column {
                anchors.fill: parent
                Image {
                    source: portrait
                    anchors.horizontalCenter: parent.horizontalCenter
                    scale: 0.5
                }
                Text {
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    font.pointSize: 16
                }
            }
            MouseArea {
                z: 1
                anchors.fill: parent
                onClicked: {
                    console.log("test");
                    grid.currentIndex = index;0
                }
            }
        }
    }


    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 450
        cellHeight: 500

        model: ContactModel {}
        delegate: contactDelegate
        highlight: Rectangle { color: "#A9A9A9"; radius: 15 }
        highlightFollowsCurrentItem: true
        focus: true
    }
}
