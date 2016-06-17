import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {
    id: facilityEditor
    focus: true

    Component.onCompleted: {
        menuBarLoader.source = "emptyItem.qml"
    }


    property int currentId
    property int facilityId
    property string facilityNameTxt
    property string facilityAddress
    property string facilityCity
    property string facilityStateName
    property string facilityZipCode

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

    Rectangle {
        id: facilityContainer
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
                id: nameRow
                height: 50
                width: parent.width

                Label {
                    id: facilityNameLabel
                    height: 30
                    color: "#ffffff"
                    text: qsTr("Facility Name: ")
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    font.bold: true
                    font.pointSize: 18

                }

                TextField {
                    id: facilityNameField
                    font.pointSize: 18
                    text: facilityNameTxt
                    width: facilityContainer.width - facilityNameLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                    focus: true
                }
            }

            Row {
                id: addressRow
                height: 50
                width: parent.width

                Text {
                    id: facilityAddressLabel
                    width: facilityNameLabel.width
                    height: 30
                    color: "#ffffff"
                    text: qsTr("Address:")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    font.pointSize: 18
                    font.bold: true
                }

                TextField {
                    id: facilityAddressField
                    font.pointSize: 18
                    text: facilityAddress
                    placeholderText: "Address"
                    width: facilityContainer.width - facilityAddressLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                }
            }

            Row {
                id: cityRow
                height: 50
                width: parent.width

                Label {
                    id: facilityCityLabel
                    width: facilityNameLabel.width
                    height: 30
                    color: "#ffffff"
                    text: qsTr("City:")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    font.bold: true
                    font.pointSize: 18
                }

                TextField {
                    id: facilityCityField
                    font.pointSize: 18
                    placeholderText: "City"
                    text: facilityCity
                    width: facilityContainer.width - facilityAddressLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                }
            }

            Row {
                id: stateRow
                height: 50
                width: parent.width

                Label {
                    id: facilityStateLabel
                    width: facilityNameLabel.width
                    height: 30
                    color: "#ffffff"
                    text: qsTr("State:")
                    font.bold: true
                    font.pointSize: 18
                }

                TextField {
                    id: facilityStateField
                    font.pointSize: 18
                    placeholderText: "State"
                    text: facilityStateName
                    width: facilityContainer.width - facilityAddressLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                }
            }

            Row {
                id: zipCodeRow
                height: 50
                width: parent.width

                Label {
                    id: facilityZipCodeLabel
                    width: facilityNameLabel.width
                    height: 30
                    color: "#ffffff"
                    text: qsTr("ZipCode:")
                    font.pointSize: 18
                    font.bold: true
                }

                TextField {
                    id: facilityZipCodeField
                    font.pointSize: 18
                    placeholderText: "Zip Code"
                    text: facilityZipCode
                    width: facilityContainer.width - facilityAddressLabel.width - 100
                    style: activeFocus ? textFieldFocused : textFieldStyle
                }
            }

//            Row {
//                id: facilityIdRow
//                height: 50
//                width: parent.width

//                Label {
//                    id: facilityIdLabel
//                    width: facilityNameLabel.width
//                    height: 30
//                    color: "orange"
//                    text: qsTr("FacilityID:")
//                    font.pointSize: 18
//                    font.bold: true
//                }

//                TextField {
//                    id: facilityIDField
//                    font.pointSize: 18
//                    placeholderText: "Facility ID"
//                    text: facilityId
//                    width: facilityContainer.width - facilityAddressLabel.width - 100
//                    style: activeFocus ? textFieldFocused : textFieldStyle
//                }

//            }

//            Row {
//                id: aRow
//                height: 50
//                width: parent.width

//                Label {
//                    id: facilityRecNumberLabel
//                    width: facilityNameLabel.width
//                    height: 30
//                    color: "orange"
//                    text: qsTr("Record Number: ")
//                    font.pointSize: 18
//                    font.bold: true
//                }

//                    TextField {
//                        id: facilityRecNumberField
//                        font.pointSize: 18
//                        placeholderText: "Record Number"
//                        text: currentId
//                        width: facilityContainer.width - facilityAddressLabel.width - 100
//                        style: activeFocus ? textFieldFocused : textFieldStyle
//                    }
//            }

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
//                console.log("Calling UpDateRecord");
//                console.log("--------------------");
//                console.log("Row Number: " + currentId);
                facilityList.updateRecord(currentId,
                                          facilityId,
                                          facilityNameField.text,
                                          facilityAddressField.text,
                                          facilityCityField.text,
                                          facilityStateField.text,
                                          facilityZipCodeField.text
                                          );
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
            }
        }

    }
}
