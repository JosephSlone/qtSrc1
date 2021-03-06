import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {
    id: facilityMenu

    default property bool filterValue: true

    RowLayout {
        ToolButton {
            iconSource: "images/plus-5-128.png"
            onClicked: {
                console.log("New Record Button Clicked")
                stackView.push(
                    {
                        item: Qt.resolvedUrl("EditFacility.qml"),
                        properties: {
                                    editMode: "New"
                                }
                    }
                )

            }
        }

        ColumnLayout {
            Label {
                text: "Active"
                color: "silver"
                font.pointSize: 14
            }

            Switch {
                id: filterSwitch
                checked: filterValue
                onClicked: {
                    if (checked) {
                        facilityList.setQFilter("isActive = 1");
                    }
                    else
                    {
                        facilityList.setQFilter("isActive = 0");
                    }
                }
            }
        }

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 10
        spacing: 20
    }

}
