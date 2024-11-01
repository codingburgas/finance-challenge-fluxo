import QtQuick 2.7
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3

Window {
    width: 420
    height: 900
    visible: true

    Rectangle {
        id: background
        width: 420
        height: 844
        visible: true
        color: "#304437"

        Rectangle {
            id: circle
            radius: 360
            z: 0
            rotation: 39
            anchors.horizontalCenterOffset: -188
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:87
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
            id: whiteRectange
            width: 420
            height: 633
            color: "#f1f1f1"
            radius: 43
            anchors.top: parent.top
            anchors.topMargin: 211
            z: 1

            Text {
                id: _text1
                x: 57
                y: 33
                text: qsTr("Deposit")
                font.pixelSize: 24
                font.family: "Segoe Ui"
                font.styleName: "Bold"
            }

            Text {
                id: _text2
                x: 76
                y: 97
                width: 269
                height: 86
                color: "#898989"
                text: qsTr("Are you sure you want \nto deposit? Would you like to note \nwhy you’re depositing \nthe money to your account?")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                font.styleName: "Regular"
            }

            ComboBox {
                id: categoryComboBox
                anchors.top: _text2.bottom
                anchors.topMargin: 74
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40

                currentIndex: -1
                onCurrentIndexChanged: {
                    if (currentIndex === -1) {
                        categoryComboBox.text = "";
                    }
                }

                model: ["Food", "Education", "Transportation", "Bills", "Shopping", "Friends and Family", "Health"]

                font.pixelSize: 16
                anchors.horizontalCenterOffset: 1
                background: Rectangle {
                    color: "#f0f0f0"
                    border.color: "#d3d3d3"
                    radius: 8
                }
            }
        }

        Rectangle {
            id: buttonRectangle
            y: 674
            width: 208
            height: 58
            color: "#3c5846"
            radius: 13
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 112
            z: 2
            anchors.horizontalCenterOffset: 0

            Text {
                id: buttonText
                color: "#f1f1f1"
                text: "Deposit"
                font.styleName: "Bold"
                font.pointSize: 19
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked:{
                    CoreOperations.deposit(categoryComboBox.text, fluxo);
                }
            }
        }

        Rectangle {
            id: navBar
            y: 772
            width: 484
            height: 95
            color: "#fdfdfd"
            radius: 43
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
            z: 2
            anchors.horizontalCenterOffset: 0
        }

        Image {
            id: money_image
            x: 228
            y: 62
            z: 3
            width: 192
            height: 233
            source: "qrc:/resources/transactionsImage.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
