import QtQuick 2.6
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQml 2.2

Rectangle {
    color: "#847a7a"
    id: facilitiesRoot
    objectName: "facilitiesGridView"

    Component.onCompleted: {
        menuBarLoader.source = "facilitiesMenu.qml"
    }

    Component {
        id: facilityDelegate

        Rectangle {
            id: wrapper
            width: grid.cellWidth
            height: grid.cellHeight
            color: "#847a7a"
            z: -1

            Keys.onPressed: {
                if ((event.key === Qt.Key_Enter) || (event.key === Qt.Key_Return) ) {
                    console.log('The enter key was pressed');
                    facilityList.currentRecord = id;
                    stackView.push(
                        {
                            item: Qt.resolvedUrl("EditFacility.qml"),
                            properties: {
                                        currentId: id,
                                        facilityNameTxt: facilityName,
                                        facilityAddress: address,
                                        facilityCity: city,
                                        facilityStateName: facilityState,
                                        facilityZipCode: zipcode,
                                        facilityIsActive: isActive
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
                    id: facilityTitle
                    text: facilityName
                    anchors.top: content.top
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    color: "white"
                    font.pointSize: 16
                }

                Text {
                    id: facilityAddress
                    text: address
                    anchors.top: facilityTitle.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    color: "white"
                    font.pointSize: 12
                }

                Text {
                    id: facilityCityState
                    text: city + ", " + facilityState + " " + zipcode
                    anchors.top: facilityAddress.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    color: "white"
                    font.pointSize: 12
                }

                Text {
                    id: dimensions
                    text: (isActive == 1) ? "Active" : "Inactive"
                    anchors.top: facilityCityState.bottom
                    anchors.left: content.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    color: "orange"
                    font.pointSize: 16
                }

                Rectangle {
                    id: portraitContainer
                    color: content.color
                    anchors.top: content.top
                    anchors.right: content.right
                    anchors.rightMargin: 5
                    anchors.topMargin: 10
                    height: parent.width/2.75
                    width: parent.width/2.75
                    Image {
                        id: portrait
                        source: "images/facility.png"
                        width: parent.width - 5
                        height: parent.height - 5
                    }
                }

                MouseArea {
                    z: 1
                    anchors.fill: parent
                    onClicked: {
                        facilityList.currentRecord = id;
                        stackView.push(
                            {
                                item: Qt.resolvedUrl("EditFacility.qml"),
                                properties: {
                                            currentId: index,
                                            facilityId: id,
                                            facilityNameTxt: facilityName,
                                            facilityAddress: address,
                                            facilityCity: city,
                                            facilityStateName: facilityState,
                                            facilityZipCode: zipcode,
                                            facilityIsActive: isActive,
                                            editMode: "Edit",
                                        }
                            }
                        )

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

        cellWidth: {(orientationToString(Screen.primaryOrientation) === "landscape") ? (Screen.width/4) - 4 : (Screen.width/2) - 4 }
        cellHeight: cellWidth * 0.75

        model: facilityList
        delegate: facilityDelegate
        //highlight: Rectangle {width: grid.cellWidth; height: grid.cellHeight; color: "#A9A9A9"; radius: 5 }
        highlight: highlight
        highlightFollowsCurrentItem: true
        focus: true
    }
}

