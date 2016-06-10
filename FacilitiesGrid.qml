import QtQuick 2.6
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.2

Rectangle {
    color: "#424246"

    Component {
        id: facilityDelegate
        Rectangle {
            id: content
            color: "#424246"
            radius: 10
            width: grid.cellWidth - 10
            height: grid.cellHeight - 10
            border.width: 2
            border.color: "silver"


            Text {
                id: facilityTitle
                text: facilityName
                anchors.top: portraitContainer.bottom
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
                text: city + ", " + state + " " + zipcode
                anchors.top: facilityAddress.bottom
                anchors.left: content.left
                anchors.topMargin: 10
                anchors.leftMargin: 10
                color: "white"
                font.pointSize: 12
            }

            Text {
                id: facilityId
                text: "Facility ID: " + id
                anchors.top: facilityCityState.bottom
                anchors.left: content.left
                anchors.topMargin: 10
                anchors.leftMargin: 10
                color: "white"
                font.pointSize: 12

            }

            Rectangle {
                id: portraitContainer
                color: content.color
                anchors.top: content.top
                anchors.right: content.right
                anchors.rightMargin: 5
                anchors.topMargin: 10
                height: 128
                width: 128
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
                    console.log(facilityName);
                    console.log(id);
                    stackView.push(
                        {
                            item: Qt.resolvedUrl("EditFacility.qml"),
                            properties: {currentId: id}
                        }
                    )
                }

            }
        }
    }


    GridView {
        id: grid
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.leftMargin: 5

        cellWidth: 500
        cellHeight: 600

        model: facilityList
        delegate: facilityDelegate
        highlight: Rectangle { color: "#A9A9A9"; radius: 15 }
        highlightFollowsCurrentItem: true
        focus: true
    }
}
