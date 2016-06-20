import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQml 2.2
import QtQuick.Layouts 1.1

Rectangle {
    id: physiciansRoot
    objectName: "physiciansGridView"

    color: "#847a7a"

    Component {
        id: physicianDelegate
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
                width: wrapper.width - 20
                height: wrapper.height - 20
                border.width: 2
                border.color: "silver"
                x: 10; y: 10;
                z: 2

                Text {
                    id: physicianName
                    text: firstname + " " + lastname
                    anchors.top: content.top
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    color: "white"
                    font.pointSize: 16
                }

                Image {
                    id: img
                    source: "file:///c:/databases/"+portrait_source
                    anchors.left: content.left
                    anchors.top: physicianName.bottom
                    anchors.margins: 10

                }

                Rectangle {
                    id: physicianStates
                    anchors.right: content.right
                    anchors.bottom: content.bottom
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    height: parent.height/2
                    width: parent.width * 2/3
                    color: "grey"
                    radius: 10
                    border.color: "#ffffff"
                    border.width: 2

                    Column {
                        spacing: 5
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 15
                        anchors.topMargin: 15
                        width: parent.width - 15
                        height: parent.height - 15

                        PhysicianTypeCell {
                            Layout.alignment: Qt.AlignLeft
                            cellColor: "DarkSalmon"
                            textColor: "Black"
                            cellText: "Nephrologist"
                            width: parent.width
                            checked: (isNephrologist == 1)
                        }

                       PhysicianTypeCell {
                            Layout.alignment: Qt.AlignLeft
                            cellColor: "DarkSalmon"
                            textColor: "Black"
                            cellText: "Interventionalist"
                            width: parent.width
                            checked: (isInterventionalist == 1)
                        }

                       PhysicianTypeCell {
                            Layout.alignment: Qt.AlignLeft
                            cellColor: "DarkSalmon"
                            textColor: "Black"
                            cellText: "Vascular Surgeon"
                            checked: (isVascular == 1)
                            width: parent.width
                        }
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
        anchors.topMargin: 15
        anchors.leftMargin: 15

        cellWidth: {(orientationToString(Screen.primaryOrientation) === "landscape") ? (Screen.width/3) - 4 : (Screen.width) - 4 }
        cellHeight: cellWidth * 0.75

        model: physicianList
        delegate: physicianDelegate
//        highlight: highlight
//        highlightFollowsCurrentItem: true

        focus: true
    }
}