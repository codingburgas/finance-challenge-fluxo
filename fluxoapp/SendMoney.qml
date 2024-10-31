pragma ComponentBehavior: Bound

import QtQuick 2.7
import QtQuick.Controls 2.2

Rectangle {
    id: window
    width: 390
    height: 844
    visible: true

    signal screenChanged(file: string)

    Rectangle {
        id: getStartedPage
        anchors.fill: parent
        color: "#304437"

        Rectangle{
            id: circle
            radius: 360
            anchors.horizontalCenterOffset: 272
            rotation: -122
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:-292
            gradient: Gradient {
                    GradientStop {position: 0.0; color: "#689A78"}
                    GradientStop {position: 0.37; color: "#3C5846"}
                }
        }

        Rectangle {
            id: whiteRectangle
            anchors.left: parent.left
            anchors.right: parent.right
            y: 334
            height: 548
            color: "#F1F1F1"
            radius: 43

            Text {
                id: textEdit
                x: 47
                y: 25
                width: 139
                height: 31
                text: qsTr("Send Money")
                font.pixelSize: 22
                font.styleName: "SemiBold"
            }

            Text {
                id: amountText
                x: 47
                y: 192
                width: 80
                height: 20
                color: "#515151"
                text: qsTr("Amount")
                font.pixelSize: 12
                rotation: 0
            }

            Text {
                id: usernameText
                x: 47
                y: 83
                width: 80
                height: 20
                color: "#515151"
                text: qsTr("Username")
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: buttonRectangle
            anchors.horizontalCenter: parent.horizontalCenter
            y: 688
            z: 3
            width: 208
            height: 58
            color: "#3C5846"
            radius: 13
            anchors.horizontalCenterOffset: 0

            Text {
                id: sendText
                x: 79
                y: 13
                width: 51
                height: 31
                color: "#ffffff"
                text: qsTr("Send")
                font.pixelSize: 22
                font.styleName: "SemiBold"
            }

            MouseArea{
                id: sendMouseArea
                anchors.fill: parent

                onClicked: {
                    window.screenChanged("MainPage.qml")
                }
            }


        }



    }

    Header{
        id: header
        x:0
        y: 55
        property bool welcomeBackText: false
        property bool menuButton: true
    }

    TextField {
        id: amount
        x: 44
        y: 547
        width: 293
        height: 56
        text: ""
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        placeholderText: ""
        z: 10
        font.weight: 400
        font.styleName: "normal"
        font.family: "Inter"
        background: Rectangle {
            width: 293
            radius: 8
            border.color: "#898989"
            border.width: 1
        }

        cursorDelegate: CursorRectangle{property QtObject textField: amount}
    }

    TextField {
        id: username
        x: 44
        y: 438
        width: 293
        height: 56
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        placeholderText: ""
        hoverEnabled: true
        z: 10
        font.weight: 400
        font.styleName: "normal"
        font.family: "Inter"
        background: Rectangle {
            width: 293
            radius: 8
            border.color: "#898989"
            border.width: 1
        }
        cursorDelegate: CursorRectangle{property QtObject textField: username}
    }

    Navbar{
        id: navbar
        property QtObject window: window
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -23
    }
}
