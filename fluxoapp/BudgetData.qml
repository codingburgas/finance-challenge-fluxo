pragma ComponentBehavior: Bound

import QtQuick 2.7
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3
import QtQuick.Window 2.15

Rectangle {
    id: window
    width: 380
    height: 844
    visible: true

    signal screenChanged(file: string)

    Rectangle {
        id: background
        width: 420
        height: 844
        visible: true
        color: "#304437"

        Rectangle {
            id: whiteRectange
            width: 420
            height: 633
            color: "#f1f1f1"
            radius: 43
            anchors.top: parent.top
            anchors.topMargin: 211
            z: 1
        }

        Rectangle{
            id: circle
            radius: 360
            z: 0
            rotation: -52
            anchors.horizontalCenterOffset: 219
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:81
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                GradientStop {position: 0.37; color: "#3C5846"}
            }
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
            id: buttonRectangle
            y: 674
            width: 208
            height: 58
            color: "#3C5846"
            radius: 13
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 112
            z: 2
            anchors.horizontalCenterOffset: 0

            Text {
                id: buttonText
                color: "#f1f1f1"
                text: "Next"
                font.styleName: "SemiBold"
                font.pointSize: 19
                font.bold: true
                anchors.centerIn: parent
            }

            NumberAnimation {
                id: animateFlow
                target: background
                properties: "x"
                duration: 500
                to: -390
                from: 0
            }

            MouseArea{
                id: nextMouseArea
                anchors.fill: parent
                onClicked: {
                    window.screenChanged("BudgetAmount.qml")
                }
            }
        }

        Text {
            id: _text1
            x: 123
            y: 121
            color: "#ffffff"
            text: qsTr("Creating a budget")
            font.pointSize: 22
            font.styleName: "SemiBold"
        }

        Text {
            id: _text2
            x: 76
            y: 244
            width: 269
            height: 86
            color: "#898989"
            text: qsTr("Please fill in this data of\n information. Remember, you can't\n change anything you enter here\n going forward.")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
            z: 2
            font.styleName: "Regular"
        }

        TextField {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            y: 388
            width: 293
            height: 56
            text: ""
            z: 10
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
                color: "#ffffff"
            }

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 20

            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 1

            cursorDelegate: CursorRectangle{property QtObject textField: title}
        }

        Text {
            id: _text3
            x: 64
            y: 365
            width: 42
            height: 23
            visible: true
            color: "#898989"
            text: qsTr("Title")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            z: 2
            font.styleName: "Regular"
        }

        ComboBox {
            id: categoryComboBox
            anchors.top: _text2.bottom
            anchors.topMargin: 152
            anchors.horizontalCenter: parent.horizontalCenter
            width: 294
            height: 56

            currentIndex: -1
            onCurrentIndexChanged: {
                if (currentIndex === -1) {
                    categoryComboBox.text = "";
                }
            }

            model: ["Food", "Education", "Transportation", "Bills", "Shopping", "Friends and Family", "Health"]

            font.pixelSize: 16
            z: 5
            anchors.horizontalCenterOffset: 1
            background: Rectangle {
                color: "#FDFDFD"
                border.color: "#898989"
                radius: 8
            }
        }

        TextField {
            id: dateInput
            anchors.horizontalCenter: parent.horizontalCenter
            y: 573
            width: 293
            height: 56
            inputMask: "99/99/9999"
            text: ""
            z: 10
            background: Rectangle {
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
                color: "#ffffff"
            }

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 20

            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 1
        }

        Text {
            id: _textDateLabel
            x: 64
            y: 553
            width: 122
            height: 23
            visible: true
            color: "#898989"
            text: qsTr("Budget Deadline")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            z: 2
            font.styleName: "Regular"
        }

        Navbar {
            id: navbar
            property QtObject window: window
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
        }

        Text {
            id: categoryChoose
            x: 64
            y: 462
            width: 140
            height: 23
            visible: true
            color: "#898989"
            text: qsTr("Choose a category")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            z: 2
            font.styleName: "Regular"
        }
    }
}
