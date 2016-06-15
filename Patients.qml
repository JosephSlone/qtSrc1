import QtQuick 2.5
import QtQuick.Window 2.1
import QtQml 2.2

Rectangle {
    color: "#847a7a"

    Component {
        id: patientDelegate
        Rectangle {
            id: wrapper
            width: grid.cellWidth
            height: grid.cellHeight
            color: "#847a7a"
            z: -1

            Rectangle {
                id: content
                color: "#424246"
                radius: 10

                width: grid.cellWidth - 20
                height: grid.cellHeight - 20
                border.width: 2
                border.color: "silver"

                x: 10; y: 10; z: 10

                Text {
                    id: nameField
                    text: firstname + " " + lastname
                    color: "white"
                    font.pointSize: 16
                    anchors.top: content.top
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }

                Text {
                    id: addressField
                    text: address
                    color: "white"
                    font.pointSize: 12
                    anchors.top: nameField.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }

                Text {
                    id: citystateField
                    text: city + ", " + state + "  " + zipcode
                    color: "white"
                    font.pointSize: 12
                    anchors.top: addressField.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }

                Text {
                    id: orientationText
                    text: {orientationToString(Screen.primaryOrientation)}
                    color: "white"
                    font.pointSize: 12
                    anchors.top: citystateField.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }


                Rectangle {
                    color: content.color
                    anchors.top: content.top
                    anchors.right: content.right
                    anchors.rightMargin: 5
                    anchors.topMargin: 10
                    height: parent.width/2.75
                    width: parent.width/2.75
                    Image {
                        id: portrait
                        source: "images/female.png"
                        width: parent.width - 5
                        height: parent.height - 5

                    }
                }

                MouseArea {
                    z: 1
                    anchors.fill: content
                    onClicked: {
                        console.log("test");
                        grid.currentIndex = index;0
                    }
                }
            }
        }
    }

    Component {
        id: highlight
        Rectangle {
            width: grid.cellWidth
            height: grid.cellHeight
            color: "blue"
            radius: 15
            x: grid.currentItem.x
            y: grid.currentItem.y
            z: 0
            opacity: 0.2
            Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
            Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }
        }
    }


    GridView {
        id: grid
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.leftMargin: 5

        cellWidth: {(orientationToString(Screen.primaryOrientation) === "landscape") ? (Screen.width/4) - 4 : (Screen.width/2) - 4 }
        cellHeight: cellWidth * 1.25

        model: patientList
        delegate: patientDelegate
        highlight: highlight
        highlightFollowsCurrentItem: true
        focus: true
    }
}
