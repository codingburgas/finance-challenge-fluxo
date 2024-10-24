import QtQuick 2.7
import QtQuick.Controls 2.2

Window {
    width: 380
    height: 844
    visible: true

    Rectangle {
        id: getStartedPage
        anchors.fill: parent
        color: "#304437"

        TextArea {
            id: username
            x: 114
            y: 548
            width: 152
            height: 51
            text: ""
            z: 10
            font.weight: Font.Medium
            placeholderText: qsTr("Username")
        }

        TextArea {
            id: password
            x: 114
            y: 632
            width: 152
            height: 51
            text: ""
            z: 10
            placeholderText: qsTr("Password")
            font.weight: Font.Medium
        }

        Rectangle {
            id: whiteRectangle
            anchors.left: parent.left
            anchors.right: parent.right
            y: 425
            height: 426
            color: "#F1F1F1"
            radius: 43
        }


        Rectangle {
            x: 90
            y: 726
            width: 200
            height: 50
            color: "#3C5846"
            radius: 10

            MouseArea {
                anchors.fill: parent
                onClicked: {

                    if (fluxo !== null)
                        SessionHandler.writeSession(username.text, password.text, fluxo);
                    else
                        console.log("App instance is null");
                }
            }
        }
    }
}
