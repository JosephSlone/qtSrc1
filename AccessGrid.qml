import QtQuick 2.4

Rectangle {
    color: "#424246"
    Component {
        id: accessDelegate
        Item {
            width: grid.cellWidth
            height: grid.cellHeight
            Column {

                Text {
                    text: Name
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    font.pointSize: 16
                }
            }
            MouseArea {
                z: 1
                anchors.fill: parent
                onClicked: {
                    console.log(accessName);
                    console.log(index)
                    grid.currentIndex = index;0
                }
            }
        }
    }


    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 200
        cellHeight: 100

        //model: AccessList {}
        model: accessList
        delegate: accessDelegate
        highlight: Rectangle { color: "#A9A9A9"; radius: 15 }
        highlightFollowsCurrentItem: true
        focus: true
    }
}
