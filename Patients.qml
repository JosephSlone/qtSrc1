import QtQuick 2.5
import QtQuick.Window 2.1
import QtQml 2.2

Rectangle {
    color: "#847a7a"

    function orientationToString(o) {
            switch (o) {
            case Qt.PrimaryOrientation:
                return "primary";
            case Qt.PortraitOrientation:
                return "portrait";
            case Qt.LandscapeOrientation:
                return "landscape";
            case Qt.InvertedPortraitOrientation:
                return "inverted portrait";
            case Qt.InvertedLandscapeOrientation:
                return "inverted landscape";
            }
            return "unknown";
        }


    Component {
        id: patientDelegate
        Rectangle {
            id: content
            color: "#424246"
            radius: 10

            width: grid.cellWidth - 10
            height: grid.cellHeight - 10
            border.width: 2
            border.color: "silver"

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
                height: 256
                width: 256
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


    GridView {
        id: grid
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.leftMargin: 5

        cellHeight: 700
        // cellWidth: 660

        cellWidth: {(orientationToString(Screen.primaryOrientation) === "landscape") ? 681 : (Screen.width/2) - 4 }

        model: patientList
        delegate: patientDelegate
        highlight: Rectangle { color: "#A9A9A9"; radius: 15 }
        highlightFollowsCurrentItem: true
        focus: true
    }
}
