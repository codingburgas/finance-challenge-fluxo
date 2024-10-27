import QtQuick 2.7
import QtQuick.Controls 2.2

Window {
    id: window
    width: 380
    height: 844
    visible: true

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

            TextEdit {
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

            TextEdit {
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
        }

    }

    Text {
        id: _text
        x: 91
        y: 46
        color: "#ffffff"
        text: qsTr("Hi There, ")
        font.pixelSize: 16
        font.weight: Font.Bold
    }

    Rectangle {
        id: rectangle
        x: 30
        y: 33
        width: 42
        height: 42
        color: "#d4de67"
        radius: 50
    }

    Rectangle {
        id: navBar
        y: 772
        width: 484
        height: 95
        color: "#fdfdfd"
        radius: 43
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -23
        z: 2
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextArea {
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
    }

    TextArea {
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
    }

}
