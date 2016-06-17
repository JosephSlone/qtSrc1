import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {

//    height: parent.height
//    width: parent.width

//    Text {
//        id: firstItem
//        text: "Item One"
//        color: "white"
//        font.pointSize: 20
//        anchors.right: parent.right
//        anchors.verticalCenter: parent.verticalCenter
//    }

//    Text {
//        text: "Item Two"
//        color: "green"
//        font.pointSize: 20
//        anchors.right: firstItem.left
//        anchors.rightMargin: 10
//        anchors.verticalCenter: parent.verticalCenter
//    }

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
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }

}
