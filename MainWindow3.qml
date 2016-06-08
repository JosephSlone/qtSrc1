import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: root
    visible: true
    //visibility: Window.FullScreen
    visibility: Window.Maximized
    width: 800
    height: 1200

    title: "KDP Access Manager"

    Rectangle {
        color: "#212126"
        anchors.fill: parent
    }

    toolBar: BorderImage {
        border.bottom: 8
        source: "images/toolbar.png"
        width: parent.width
        height: 100

        RowLayout {
            anchors.fill: parent

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
                        patientLabel.visible = false;
                        patientActiveCombo.visible = false;
                        patientFacilities.visible = false;
                    }
                }
            }

            Text {
                font.pointSize: 28
                Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
                x: backButton.x + backButton.width + 20
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: "Access Manager"
            }

            Item {Layout.fillWidth: true }
            Label {
                id: patientLabel
                visible: false
                text: "Patients:"
                color: "white"
                font.pointSize: 16
            }

            Switch {
                id: patientActiveCombo
                checked: true
                visible: false
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10
                style: switchStyle

            }

            ComboBox {
                id: patientFacilities
                model: ["All Facilities", "KDP", "Other"]
                width: 400
                activeFocusOnPress: true
                visible: false
                style: ComboBoxStyle {
                    background: Rectangle {
                        radius: 5
                        border.width: 2
                        color: "#fff"
                    }
                    label: Text {
                        font.pointSize: 16
                        color: "black"
                        text: control.currentText
                    }
                    property Component __dropDownStyle: MenuStyle {
                        __maxPopupHeight: 600
                        __menuItemType: "comboboxitem"

                        frame: Rectangle {
                            color: "#fff"
                            border.width: 2
                            radius: 5
                        }

                        itemDelegate.label: Text {
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 16
                            text: styleData.text
                        }
                    }
                }
            }




        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Patients"
            page: "Patients.qml"
        }
        ListElement {
            title: "Facilities"
            page: "Facilities.qml"
        }
        ListElement {
            title: "Physicians"
            page: "Physicians.qml"
        }
        ListElement {
            title: "Access Types"
            page: "Accesses.qml"
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
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate:StackDelegate {
                    text: { title

                    }

                    onClicked: {
                        if (page == "Patients.qml")
                        {
                            patientLabel.visible = true;
                            patientActiveCombo.visible = true;
                            patientFacilities.visible = true;
                        }

                        stackView.push(Qt.resolvedUrl(page))
                    }
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
