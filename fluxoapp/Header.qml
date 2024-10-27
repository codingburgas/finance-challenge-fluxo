import QtQuick 2.7
import QtQuick.Layouts 1.3

Rectangle{
    /*
    params to be set:
    welcomeBackText: bool - whether show 'Welcome back' text
    */
    id: header
    width: 390
    height: 42
    color: "#00000000"
    border.color: "#00000000"


    Rectangle {
        id: profilePic
        x: 19
        anchors.verticalCenter: parent.verticalCenter
        width: 42
        height: 42
        color: "#d4de67"
        radius: 50
    }

    Text {
        id: greetingText
        x: 71
        y: (parent.welcomeBackText) ? 0:9
        width: 193
        height: 23

        color: "#ffffff"
        text: qsTr("Hi There, ")
        font.letterSpacing: 0.02
        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 600
        font.pixelSize: 14
    }

    Text {
        visible: parent.welcomeBackText
        id: welcomeBackText
        x: 71
        y: 29
        width: 127
        height: 13

        color: "#ffffff"
        text: qsTr("Welcome back to Fluxo")
        font.letterSpacing: 0.02
        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 300
        font.pixelSize: 11
    }

    Rectangle{
        id: menu
        x: 341
        anchors.verticalCenter: parent.verticalCenter
        width: 30
        height: 30
        color: "#00ffffff"

        ColumnLayout{
            anchors.centerIn: parent
            Rectangle{
                id: line1
                Layout.preferredWidth: 22.5
                Layout.preferredHeight: 3
                border.width: 7
            }
            Rectangle{
                id: line2
                Layout.preferredWidth: 22.5
                Layout.preferredHeight: 3
                border.width: 7
            }
            Rectangle{
                id: line3
                Layout.preferredWidth: 22.5
                Layout.preferredHeight: 3
                border.width: 7
            }
        }
        MouseArea{
            id: menuMouseArea
            anchors.fill: parent
        }

    }
}

