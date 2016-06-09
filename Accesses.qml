import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    width: parent.width
    height: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: "lightgrey"

    Rectangle {
        id: tableContainer
        radius: 10
        width: parent.width
        height: parent.height - buttonRow.height
        x: 0

        color: "darkGrey"

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
            height: parent.height
            width: parent.width

            style: TableViewStyle {
                id: tableViewStyleDark
                backgroundColor: "#111111"
                alternateBackgroundColor: "#222222"
                textColor: "#FFFFFF"
                highlightedTextColor: "#EEEEEE"

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
                    height: 60
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
                        x: 10
                        //color: styleData.Selected ? "orange" : "white"
                        color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 20

                    }

                    Rectangle {
                        //color:  styleData.alternate ? "DarkGrey" : "LightGrey"

                    }

                }
            }
        }
    }

    Rectangle {
        id: buttonRow
        width: parent.width
        height: 100
        anchors.top: tableContainer.bottom

        color: "black"
        Row {
            height: 100
            anchors.top: buttonRow.top
            anchors.topMargin: 10
            Button {
                id: buttonNew
                text: "New"

                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 50
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 10
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                    label: Text {
                        renderType: Text.NativeRendering
                         verticalAlignment: Text.AlignVCenter
                         horizontalAlignment: Text.AlignHCenter
                         font.family: "Helvetica"
                         font.pointSize: 20
                         color: "black"
                         text: control.text
                    }
                }
            }

            Button {
                text: "Delete"
                id: buttonDelete
                anchors.left: buttonNew.right
                anchors.leftMargin: 20
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 50
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 10
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                    label: Text {
                        renderType: Text.NativeRendering
                         verticalAlignment: Text.AlignVCenter
                         horizontalAlignment: Text.AlignHCenter
                         font.family: "Helvetica"
                         font.pointSize: 20
                         color: "black"
                         text: control.text
                    }
                }

            }
        }

    }

}
