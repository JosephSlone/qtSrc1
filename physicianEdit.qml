import QtQuick 2.6
import QtQml 2.2
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4


Item {

    id: physicianEditor

    property string editMode: "Edit"
    property int currentId
    property string firstName
    property string lastName
    property bool isActive
    property bool isNephrologist
    property bool isVascular
    property bool isInterventionalist

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
        }
    }

    Component {
        id: switchStyle
        SwitchStyle {
            groove: Rectangle {
                    implicitWidth: 120
                    implicitHeight: 40
                    radius: 10
                    border.color: control.activeFocus ? "darkblue" : "silver"
                    border.width: 2
                    color: control.checked ? "green" : "red"
            }

            handle: Rectangle {
                width: parent.parent.width/2
                height: control.height
                color: "blue"
                border.color: "silver"
                border.width: 2
                radius: 10
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
                    text: firstName
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
                    width: firstNameLabel.width

                }

                TextField {
                    id: lastNameField
                    font.pointSize: 18
                    text: lastName
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

                Label {
                    id: physicianTypeLabel
                    height: 30
                    color: "#ffffff"
                    text: qsTr("Type(s): ")
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    font.bold: true
                    font.pointSize: 18
                    width: firstNameLabel.width

                }

                Rectangle {
                    width: checkBoxColumn.width + 20
                    height: checkBoxColumn.height + 20
                    color: "transparent"
                    border.color: "grey"
                    border.width: 3
                    radius: 10

                    Column {
                        id: checkBoxColumn
                        spacing: 25
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin:  10
                        anchors.leftMargin: 10

                        CheckBox {
                            id: isNephrologistCheckBox
                            text: "Nephrologist"
                            checked: isNephrologist
                            style: checkboxStyle
                        }
                        CheckBox {
                            id: isVascularCheckBox
                            text: "Vascular Surgeon"
                            checked: isVascular
                            style: checkboxStyle
                        }
                        CheckBox {
                            id: isInterventionalistCheckBox
                            text: "Interventionalist"
                            checked: isInterventionalist
                            style: checkboxStyle
                        }
                    }
                }
            }

            Row {
                id: isActiveRow
                height: 50
                width: parent.width

                Label {
                    id: isActiveLabel
                    height: 30
                    width: firstNameLabel.width
                    color: "#ffffff"
                    text: qsTr("Is Active: ")
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    font.bold: true
                    font.pointSize: 18

                }

                Switch {
                    id: isActiveSlider
                    style: switchStyle
                    width: 110
                    anchors.verticalCenter: isActiveLabel.verticalCenter

                }

            }
        }
        Button {
            id: saveButton
            anchors.top: column.bottom
            anchors.topMargin: 25
            anchors.right: cancelButton.left
            anchors.rightMargin: 25
            height: 40
            text: qsTr("Save")
            activeFocusOnPress: true
            tooltip: "Save Changes"
            isDefault: true
            style: buttonStyle
            onClicked: {
                if (editMode === "Edit") {
//                    facilityList.updateRecord(currentId,
//                                              facilityId,
//                                              facilityNameField.text,
//                                              facilityAddressField.text,
//                                              facilityCityField.text,
//                                              facilityStateField.text,
//                                              facilityZipCodeField.text,
//                                              (facilityIsActiveField.checked) ? 1: 0
//                                              );
                    stackView.pop();
                    setMenuBar();
                }
                else
                {
//                    facilityList.newRecord(   facilityNameField.text,
//                                              facilityAddressField.text,
//                                              facilityCityField.text,
//                                              facilityStateField.text,
//                                              facilityZipCodeField.text,
//                                              (facilityIsActiveField.checked) ? 1: 0
//                                              );
                    stackView.pop();
                    setMenuBar();

                }
            }
        }

        Button {
            id: cancelButton
            anchors.right: column.right
            anchors.rightMargin: 50
            anchors.top: column.bottom
            anchors.topMargin: 25
            height: 40
            text: qsTr("Cancel")
            activeFocusOnPress: true
            tooltip: "Cancel Changes"
            isDefault: true
            style: buttonStyle
            onClicked: {
                stackView.pop();
                setMenuBar();
            }
        }

    }
}
