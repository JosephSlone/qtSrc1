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
    color: "#758de1"
    visibility: "FullScreen"
    title: qsTr("KDP Access Manager")

    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.margins: spacing
            Label {
                text: "Patients"
                font.pointSize: 20
                color: "steelblue"
            }
            Item { Layout.fillWidth: true }

            Button {
                id: exit
                text: "Exit"
                onClicked: {Qt.quit();}
                style: ButtonStyle {
                    label: Text {
                      renderType: Text.NativeRendering
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignHCenter
                      font.family: "Helvetica"
                      font.pointSize: 20
                      color: "blue"
                      text: control.text
                    }
                }
            }
        }
    }


    Label {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

}
