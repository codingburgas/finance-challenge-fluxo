import QtQuick 2.7
import QtQuick.Controls 2.2

Rectangle {
    id: window
    width: 380
    height: 844
    visible: true

    signal screenChanged(file: string)

    Rectangle {
        id: background
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
                source: ":/logo.png"
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
            y: 323.5

        }

        Rectangle{
            width: 319
            height: 93
            border.width: 0
            z:2
            anchors.horizontalCenter: circle.horizontalCenter
            y: 0.42*window.height

            Text {
                id: textMain
                width: 319
                height: 93
                anchors.centerIn: parent

                text: "<font color=\"#689A78\">Sign in</font> <font color=\"#000000\">to an already</p>existing account or</font> <font color=\"#689A78\">Create<p>yours</font> <font color=\"#000000\">today!</font>"
                font.family: "Inter"
                font.styleName: "normal";
                font.weight: 600;
                font.pixelSize: 24

                horizontalAlignment: Text.AlignHCenter
                //lineHeight: 29
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
            placeholderText: qsTr("Username")
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
            }

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 20

            verticalAlignment: Text.AlignVCenter
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
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
            }

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 20

            verticalAlignment: Text.AlignVCenter
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
                text: "Register"
                color: "#f1f1f1"
                anchors.centerIn: parent

                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 700
                font.pixelSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (fluxo !== null) {
                        SessionHandler.writeSession(username.text, password.text, fluxo);
                    }
                }
            }
        }
    }

    Connections {
        target: SessionHandler

        function onSessionWritingCompletedChanged() {
            if (SessionHandler.sessionWritingCompleted) {
                window.screenChanged("MainPage.qml")
            }
        }
    }
}
