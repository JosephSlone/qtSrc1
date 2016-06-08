import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    width: 800
    height: 800


    TableView {
        id: accessView
        highlightOnFocus: true
        TableViewColumn {
            role: "accessName"
            title: "Access Type"
        }
        model: AccessList{}
        focus: true
        selectionMode: SelectionMode.SingleSelection

        style: TableViewStyle {
            id: tableViewStyleDark
            backgroundColor: "#111111"
            alternateBackgroundColor: "#222222"
            textColor: "#FFFFFF"

            headerDelegate: Rectangle {
                height: textItem.implicitHeight * 1.2
                width: textItem.implicitWidth
                color: "#646060"
                Text {
                    id: textItem
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: styleData.textAlignment
                    anchors.leftMargin: 12
                    text: styleData.value
                    elide: Text.ElideRight
                    color: "#FFFFFF"
                    font.pointSize: 20
                }
                Rectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 1
                    anchors.topMargin: 1
                    width: 1
                    color: "#a8afb9"
                }
            }

            rowDelegate: Rectangle {
                width: childrenRect.width
                height: 40
                readonly property int modelRow: styleData.row ? styleData.row : 0
                color:  styleData.alternate ? "DarkGrey" : "LightGrey"

                Text {
                    color: styleData.selected ? "blue" : "red"

                }

                MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("[!] log: " + modelRow);
                        }
                }
            }

            itemDelegate: Item {
                id: wrapper
                anchors.fill: parent

                Text {
                    text: styleData.value
                    x: 5
                    //color: styleData.Selected ? "orange" : "white"
                    //color: "blue"


                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 15
                }

                Rectangle {
                    //color:  styleData.alternate ? "DarkGrey" : "LightGrey"

                }

            }
        }
    }
}
