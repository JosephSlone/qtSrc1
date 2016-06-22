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

    Component.onCompleted: {
        menuBarLoader.setSource("physiciansMenu.qml");
        rootWindow.subTitleText = "Physicians"
        rootWindow.subTitleVisible = true
    }

    Component {
        id: physicianDelegate

        Rectangle {
            id: wrapper
            width: grid.cellWidth
            height: grid.cellHeight
            color: "#847a7a"
            z: -1

            Keys.onPressed: {
                if ((event.key === Qt.Key_Enter) || (event.key === Qt.Key_Return) ) {
                    console.log('The enter key was pressed');
                    stackView.push(
                        {
                            item: Qt.resolvedUrl("physicianEdit.qml"),
                            properties: {
                                currentId: index,
                                //facilityId: id,
                                firstName: firstname,
                                lastName: lastname,
                                isNephrologist: isNephrologist,
                                isVascular: isVascular,
                                isInterventionalist: isInterventionalist,
                                isActive: isActive,
                                portraitFileLocation: portrait_source,
                                editMode: "Edit",
                            }
                        }
                    )
                    event.accepted = true;
                }
            }

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

                Rectangle {
                    height: parent.height * 0.5
                    width: parent.width * 0.5
                    anchors.top: physicianName.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    color: parent.color

                    Image {
                        id: img
                        source: portrait_source
                        width: parent.height
                        height: parent.width
                        fillMode: Image.PreserveAspectFit
                        verticalAlignment: Image.AlignTop
                        horizontalAlignment: Image.AlignLeft
                    }
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

            MouseArea {
                z: 1
                anchors.fill: parent
                onClicked: {
                    console.log("Mouse Clicked");
                    facilityList.currentRecord = id;
                    stackView.push(
                        {
                            item: Qt.resolvedUrl("physicianEdit.qml"),
                            properties: {
                                        currentId: index,
                                        //facilityId: id,
                                        firstName: firstname,
                                        lastName: lastname,
                                        isNephrologist: isNephrologist,
                                        isVascular: isVascular,
                                        isInterventionalist: isInterventionalist,
                                        isActive: isActive,
                                        portraitFileLocation: portrait_source,
                                        editMode: "Edit",
                                    }
                        }
                    )

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
        highlight: highlight
        highlightFollowsCurrentItem: true

        focus: true
    }
}
