import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: rootWindow
    visible: true
    //visibility: Window.FullScreen
    visibility: Window.Maximized
    width: 800
    height: 1200
    title: "KDP Access Manager"

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


    Rectangle {
        color: "#212126"
        anchors.fill: parent
    }

// -- Beginning of ToolBar -- //

    Component {
        id: emptyItem
        Text {
            text: ""
        }
    }

    toolBar: BorderImage {
            border.bottom: 8
            source: "images/toolbar.png"
            width: parent.width
            height: appTitle.height * 1.2

            Rectangle {
                id: backButton
                width: opacity ? 60 : 0
                anchors.left: parent.left
                anchors.leftMargin: 20
                opacity: stackView.depth > 1 ? 1 : 0
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                height: 60
                radius: 4
                color: backmouse.pressed ? "#222" : "transparent"
                Behavior on opacity { NumberAnimation{} }
                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/navigation_previous_item.png"
                }
                MouseArea {
                    id: backmouse
                    anchors.fill: parent
                    anchors.margins: -10
                    onClicked: {
                        stackView.pop()
                        console.log("StackView.depth: ", stackView.depth);
                        console.log("StackView.currentItem: ", stackView.currentItem.objectName);
                        switch (stackView.currentItem.objectName) {
                        case "rootView":
                            menuBarLoader.source = "emptyItem.qml"
                            break;
                        case "facilitiesGridView":
                            menuBarLoader.source = "facilitiesMenu.qml"
                            break;
                        }
                    }
                }
            }

            Text {
                id: appTitle
                font.pointSize: 32
                Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
                x: backButton.x + backButton.width + 20
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: "Access Manager"
            }

            Rectangle {
                id: menuBarContainer
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: "black"
                height: parent.height - 5
                width: 500
//                border.color: "orange"
//                border.width: 1
                Loader {
                    id: menuBarLoader
                    source: "emptyItem.qml"
    //                sourceComponent: emptyItem
                    height: parent.height
                    width: parent.width
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right

                }
            }
    }

// --- End of ToolBar -- //

    ListModel {
        id: pageModel
        ListElement {
            title: "Patients"
            page: "Patients.qml"
            icon: "images/patients.png"
        }
        ListElement {
            title: "Facilities"
            page: "FacilitiesGrid.qml"
            icon: "images/facility.png"
        }
        ListElement {
            title: "Physicians"
            page: "Physicians.qml"
            icon: "images/doctor.png"
        }
        ListElement {
            title: "Access Types"
            page: "AccessGrid.qml"
            icon: "images/DialysisIcon.png"
        }

    }

    StackView {
        id: stackView
        anchors.fill: parent
        // Implements back key navigation
        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stackView.depth > 1) {
                             stackView.pop();
                             event.accepted = true;
                         }

        initialItem: Item {
            width: parent.width
            height: parent.height
            objectName: "rootView"

            ListView {
                model: pageModel
                anchors.fill: parent

                delegate: StackDelegate {
                    onClicked: {
                        stackView.push(Qt.resolvedUrl(page))
                    }
                }
            }
        }

        delegate: StackViewDelegate {

            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 500
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 500
                }
            }
        }
    }

    Component {
        id: switchStyle
        SwitchStyle {

            groove: Rectangle {
                implicitHeight: 50
                implicitWidth: 200
                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: parent.width/2 - 2
                    height: 20
                    anchors.margins: 2
                    radius: 5
                    color: control.checked ? "#468bb7" : "#222"
                    Behavior on color {ColorAnimation {}}
                    Text {
                        font.pixelSize: 23
                        color: "white"
                        anchors.centerIn: parent
                        text: "Active"
                    }
                }
                Item {
                    width: parent.width/2
                    height: parent.height
                    anchors.right: parent.right
                    Text {
                        font.pixelSize: 23
                        color: "white"
                        anchors.centerIn: parent
                        text: "Inactive"
                    }
                }
                color: "#222"
                border.color: "#444"
                border.width: 2
            }
            handle: Rectangle {
                width: parent.parent.width/2
                height: control.height
                color: "#444"
                border.color: "#555"
                border.width: 2
                radius: 5
            }
        }
    }
}
