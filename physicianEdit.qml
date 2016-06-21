import QtQuick 2.6
import QtQml 2.2
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4


Item {

    id: physicianEditor

    Component.onCompleted: {
        menuBarLoader.source = "emptyItem.qml"
        rootWindow.subTitleText = "Physician Editor"
        rootWindow.subTitleVisible = true
    }

    Component {
       id: textFieldStyle
       TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 10
                border.color: "grey"
                border.width: 4
             }
       }
    }

    Component {
       id: textFieldFocused
       TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 10
                border.color: "orange"
                border.width: 6
             }
       }
    }

    Component {
        id: buttonStyle
        ButtonStyle {
            background: Rectangle {
                border.color: control.activeFocus ? "orange" : "grey"
                border.width: control.activeFocus ? 6 : 1
                implicitWidth: 120
                radius: control.activeFocus ? 10 : 5
            }
        }
    }

    Component {
        id: checkboxStyle
        CheckBoxStyle {
            label: Text {
                color: "white"
                text: control.text
                font.pointSize: 18
                font.bold: true
            }

            indicator: Rectangle {
                    implicitWidth: 36
                    implicitHeight: 36
                    radius: 10
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: "green"
                        border.color: "#333"
                        radius: 24
                        anchors.margins: 4
                        anchors.fill: parent
                    }
            }
        }
    }

    Rectangle {
        id: container
        anchors.rightMargin: 50
        anchors.bottomMargin: 50
        anchors.leftMargin: 50
        anchors.topMargin: 50
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#390202"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        anchors.fill: parent
        border.color: "silver"
        radius: 10

        ColumnLayout {

            id: column
            width: parent.width
            spacing: 25
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 25
            anchors.rightMargin: 25
            anchors.topMargin: 25

            Row {
                id: firstNameRow
                height: 50
                width: parent.width

                Label {
                    id: firstNameLabel
                    height: 30
                    color: "#ffffff"
                    text: qsTr("First Name: ")
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    font.bold: true
                    font.pointSize: 18

                }

                TextField {
                    id: firstNameField
                    font.pointSize: 18
                    text: ""
                    width: container.width - firstNameLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                    focus: true
                    placeholderText: "First Name"
                }
            }

            Row {
                id: lastNameRow
                height: 50
                width: parent.width

                Label {
                    id: lastNameLabel
                    height: 30
                    color: "#ffffff"
                    text: qsTr("Last Name: ")
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    font.bold: true
                    font.pointSize: 18

                }

                TextField {
                    id: lastNameField
                    font.pointSize: 18
                    text: ""
                    width: container.width - firstNameLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                    focus: true
                    placeholderText: "Last Name"
                }
            }

            Row {
                id: checksRow
                height: 50
                width: parent.width
                anchors.leftMargin: 10

                Column {
                    spacing: 25
                    anchors.leftMargin: 10
                    anchors.left: parent.left

                    CheckBox {
                        id: isNephrologistCheckBox
                        text: "Nephrologist"
                        checked: false
                        style: checkboxStyle
                    }
                    CheckBox {
                        id: isVascularCheckBox
                        text: "Vascular Surgeon"
                        checked: false
                        style: checkboxStyle
                    }
                    CheckBox {
                        id: isInterventionalistCheckBox
                        text: "Interventionalist"
                        checked: false
                        style: checkboxStyle
                    }
                }

            }


        }
    }
}
