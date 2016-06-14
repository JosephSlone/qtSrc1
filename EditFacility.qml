import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {
    id: facilityEditor
    property int currentId
    property string facilityNameTxt
    property string facilityAddress
    property string facilityCity
    property string facilityStateName
    property string facilityZipCode

    Rectangle {
        id: facilityContainer
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
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

        Label {
            id: facilityNameLabel
            height: 30
            color: "#ffffff"
            text: qsTr("Facility Name: ")
            verticalAlignment: Text.AlignTop
            anchors.left: parent.left
            anchors.leftMargin: 25
            anchors.top: parent.top
            anchors.topMargin: 20
            style: Text.Normal
            font.bold: true
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
        }

        TextField {
            id: facilityNameField
            anchors.bottom: facilityNameLabel.bottom
            anchors.left: facilityNameLabel.right
            anchors.leftMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 25
            font.pointSize: 18
            text: facilityNameTxt
            anchors.top: facilityNameLabel.top
        }

        Text {
            id: facilityAddressLabel
            width: 179
            height: 30
            color: "#ffffff"
            text: qsTr("Address:")
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 18
            verticalAlignment: Text.AlignTop
            font.bold: true
            anchors.left: parent.left
            anchors.leftMargin: 25
            anchors.top: facilityNameLabel.bottom
            anchors.topMargin: 15
        }

        TextField {
            id: facilityAddressField
            height: 35
            anchors.top: facilityAddressLabel.top
            anchors.left: facilityAddressLabel.right
            anchors.leftMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.bottom: facilityAddressLabel.bottom
            font.pointSize: 18
            text: facilityAddress
        }

        Label {
            id: facilityCityLabel
            width: 179
            height: 30
            color: "#ffffff"
            text: qsTr("City:")
            anchors.left: parent.left
            anchors.leftMargin: 25
            font.bold: true
            font.pointSize: 18
            anchors.top: facilityAddressLabel.bottom
            anchors.topMargin: 15
        }

        Label {
            id: facilityStateLabel
            x: 25
            y: 161
            width: 179
            height: 30
            color: "#ffffff"
            text: qsTr("State:")
            font.bold: true
            font.pointSize: 18
        }

        Label {
            id: facilityZipCodeLabel
            width: 179
            height: 30
            color: "#ffffff"
            text: qsTr("ZipCode:")
            styleColor: "#ffffff"
            anchors.left: parent.left
            anchors.leftMargin: 25
            anchors.top: facilityStateLabel.bottom
            anchors.topMargin: 15
            font.pointSize: 18
            font.bold: true
        }

        TextField {
            id: facilityCityField
            y: 110
            height: 30
            font.pointSize: 18
            placeholderText: facilityCity
            text: facilityCity
            anchors.leftMargin: 15
            anchors.bottom: facilityCityLabel.bottom
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.left: facilityCityLabel.right
        }

        TextField {
            id: facilityStateField
            y: 161
            height: 30
            font.pointSize: 18
            placeholderText: facilityStateName
            text: facilityStateName
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.left: facilityStateLabel.right
            anchors.leftMargin: 15
            anchors.bottom: facilityStateLabel.bottom
        }

        TextField {
            id: facilityZipCodeField
            y: 206
            height: 30
            font.pointSize: 18
            placeholderText: qsTr("Text Field")
            text: facilityZipCode
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.left: facilityZipCodeLabel.right
            anchors.leftMargin: 15
            anchors.bottom: facilityZipCodeLabel.bottom
        }

        Button {
            id: saveButton
            x: 25
            y: 273
            height: 40
            text: qsTr("Save")
            activeFocusOnPress: true
            tooltip: "Save Changes"
            isDefault: true
            style: ButtonStyle {
                background: Rectangle {
//                    implicitWidth: 100
//                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
                label: Text {
                    font.pointSize: 20
                    text: control.text
                }
            }

        }

    }
}
