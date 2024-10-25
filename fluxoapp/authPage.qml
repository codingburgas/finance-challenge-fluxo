import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Controls

Window{
    id: window
    width: 390
    height: 844
    Rectangle {
        id: authPage
        anchors.fill: parent
        color: "#304437"

        Rectangle{
            width:113
            height:33
            color: "#00ffffff"
            border.width: 0
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5

            Image{
                id: logoImage
                width:113
                height:33
                source: "resources/logo.png"
                anchors.centerIn: parent
            }
        }



        Rectangle{
            id: circle
            radius: 360
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:174
            gradient: Gradient {
                    GradientStop {position: 0.0; color: "#689A78"}
                    GradientStop {position: 0.37; color: "#3C5846"}
                }
        }

        Rectangle {
            id: whiteRectangle
            anchors.left: parent.left
            anchors.right: parent.right
            y: 308
            height: 543
            color: "#FDFDFD"
            radius: 43
        }

        Rectangle{
            id: line
            width: 52
            height: 3
            border.width: 7
            anchors.horizontalCenter: parent.horizontalCenter
            property double y: 323.5

        }

        Rectangle{
            y: 470
            width: 319
            height: 93
            border.width: 0
            z:2
            anchors.horizontalCenter: parent.horizontalCenter
            property double y: (0.42*parent.height)

            Text {
                id: textMain
                width: 319
                height: 93
                anchors.centerIn: parent

                text: "<font color=\"#689A78\">Sign in</font> <font color=\"#000000\">to an already<p>existing account or</font><font color=\"#689A78\">Create<p>yours</font> <font color=\"#000000\">today!</font>"
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                lineHeight: 29
                z:3
            }
        }



        TextArea {
            id: username
            anchors.horizontalCenter: parent.horizontalCenter
            y: 498
            width: 293
            height: 56
            text: ""
            z: 10
            font.weight: Font.Medium
            placeholderText: qsTr("Username")
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
            }
        }

        TextArea {
            id: password
            anchors.horizontalCenter: parent.horizontalCenter
            y: 571
            width: 293
            height: 56
            text: ""
            z: 10
            placeholderText: qsTr("Password")
            font.weight: Font.Medium
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
            }
        }




        Rectangle {
            id: buttonRectangle
            x: 90
            y: 726
            width: 200
            height: 50
            color: "#3C5846"
            radius: 10

            Text {
                id: buttonText
                text: "Get started"
                color: "#f1f1f1"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
            }

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
