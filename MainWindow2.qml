//import Qt.labs.controls 1.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    color: "steelblue"

    property var navBarOpen: true

    visibility: "Maximized"
    title: qsTr("KDP Access Manager")

    onActiveChanged: {
        if (!active) {
            root.visibility = Window.Minimized
        }
    }

    toolBar: ToolBar {

        id: toolBar

        RowLayout {
        anchors.fill: parent
        anchors.margins: spacing

            Image {
                source: "qrc:/images/drawer.png"

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        if (navBarOpen)
//                        {
//                            navDrawer.close()
//                            navBarOpen = false
//                        }
//                        else
//                        {
//                            navDrawer.open()
//                            navBarOpen = true
//                        }
//                    }
//                }
            }

            Item { Layout.fillWidth: true }

            Label {text: "Filters" }
            ComboBox {
                width: 200
                model: [ "Banana", "Apple", "Coconut" ]
                //anchors.right: fullScreenLabel
                //anchors.rightMargin: 25
            }

            Label {
                id: fullScreenLabel
                text: "Full Screen"}
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
        }
    }

//    Drawer {
//        id: navDrawer
//        y: toolBar.height
//        Pane {
//            padding: 0
//            width: 100
//            height: root.height-toolBar.height

//            ColumnLayout {
//                Label {
//                    text: "Menu Item 1"

//                }
//                Label {
//                    text: "Menu Item 2"
//                }
//            }
//        }
//    }

    StackView {
        id: stackView
        anchors.fill: parent

        // Implements back key navigation
        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stackView.depth > 1) {
                             stackView.pop();
                             event.accepted = true;
                         }
    }

}
