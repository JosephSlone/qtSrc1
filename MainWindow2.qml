import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    color: "steelblue"

    visibility: "Maximized"
    title: qsTr("KDP Access Manager")

    onActiveChanged: {
        if (!active) {
            root.visibility = Window.Minimized
        }
    }

    toolBar: ToolBar {

        id: toolBar

        style: ToolBarStyle {
                padding {
                    left: 8
                    right: 0
                    top: 3
                    bottom: 3
                }
                background: Rectangle {
                    //implicitWidth: 100
                    //implicitHeight: 40
                    border.color: "#999"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "#fff" }
                        GradientStop { position: 1 ; color: "#eee" }
                    }
                }
            }

          RowLayout {
            anchors.fill: parent
            anchors.margins: spacing

//            Label {
//                text: "KDP Access Manager"
//                font.pointSize: 20
//                color: "steelblue"
//            }

            Image {
                source: "qrc:/images/drawer.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.info("image clicked")
                    }
                }
            }


            Item { Layout.fillWidth: true }


            Label {text: "Full Screen"}

            Switch{
                id: fullScreenSwitch
                checked: false
                onClicked: {
                    if ( checked ) {
                        root.visibility = Window.FullScreen
                    }
                    else {
                        root.visibility = Window.Maximized
                    }
                }

            }

//            CheckBox {
//                id: fullScreen
//                text: "Full Screen"
//                style: CheckBoxStyle {
//                    indicator: Rectangle {
//                            implicitWidth: 16
//                            implicitHeight: 16
//                            radius: 3
//                            border.color: control.activeFocus ? "darkblue" : "gray"
//                            border.width: 1
//                            Rectangle {
//                                visible: control.checked
//                                color: "#555"
//                                border.color: "#333"
//                                radius: 1
//                                anchors.margins: 4
//                                anchors.fill: parent
//                            }

//                    }
//                }
//                onClicked: {
//                    if ( checked ) {
//                        root.visibility = Window.FullScreen
//                    }
//                    else {
//                        root.visibility = Window.Maximized
//                    }
//                }

//            }

//            Image {
//                id: minimize
//                source: "qrc:/images/Minimize.png"
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        root.visibility = Window.Minimized
//                    }
//                }
//            }

//            Image {
//                id: exit
//                source: "qrc:/images/powerButton.png"
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        Qt.quit()
//                    }
//                }
//            }

        }
    }

    Drawer {
        id: navDrawer

        Pane {
            padding: 0
            width: 100
            height: root.height

            ColumnLayout {
                Label {
                    text: "Menu Item 1"
                }
                Label {
                    text: "Menu Item 2"
                }
            }
        }
    }

    Label {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

}
