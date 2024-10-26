import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    id: window
    width: 420
    height: 900
    visible: true

    Loader {
        id: loader
        anchors.fill: parent
    }

    Rectangle {
        id: background
        width: 420
        height: 844
        visible: true
        color: "#304437"


        Image {
            id: transactionsImage
            width: 147
            height: 191
            source: "qrc:/resources/logo.png"
            anchors.horizontalCenterOffset: 123
            z: 3
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 99
        }

        Rectangle{
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

            TextArea {
                id: inputField
                width: 300
                height: 50
                x: 60
                y: 116
                readOnly: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignJustify
                verticalAlignment: Text.AlignVCenter
                background: Rectangle {
                    color: "#f0f0f0"
                    radius: 8
                    border.color: "#d3d3d3"
                }
            }


            GridLayout {
                id: keypadLayout
                columns: 3
                rowSpacing: 10
                columnSpacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: inputField.bottom
                anchors.topMargin: 30

                Repeater {
                    model: [
                        { text: "1" }, { text: "2" }, { text: "3" },
                        { text: "4" }, { text: "5" }, { text: "6" },
                        { text: "7" }, { text: "8" }, { text: "9" },
                        { text: "." }, { text: "0" }, { text: "<", isBackspace: true }
                    ]

                    delegate: Button {
                        text: modelData.text
                        width: 110
                        height: 54
                        font.pixelSize: 19
                        background: Rectangle {
                            color: "#EEEEEE"
                            radius: 16
                            border.color: "#d3d3d3"
                        }

                        onClicked: {
                            if (modelData.isBackspace) {
                                if (inputField.text.length > 0) {
                                    inputField.text = inputField.text.slice(0, -1);
                                }
                            } else {
                                inputField.text += text;
                            }
                        }
                    }
                }
            }


        }

        Text {
            id: buttonText1
            color: "#000000"
            text: "Deposit"
            font.styleName: "Semibold"
            font.pointSize: 26
            font.bold: true
            anchors.top: transactionsImage.bottom
            anchors.topMargin: -60
            z: 3
            anchors.horizontalCenterOffset: -116
            anchors.horizontalCenter: parent.horizontalCenter
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

            MouseArea {
                   anchors.fill: parent
                   onClicked: {

                       loader.source = "depositCategory.qml";
                   }
               }

            Text {
                id: buttonText
                color: "#f1f1f1"
                text: "Next"
                font.styleName: "Light"
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
    }

    Image {
        id: money_image
        x: 203
        y: 72
        width: 245
        height: 297
        source: "resources/money_image.png"
        fillMode: Image.PreserveAspectFit
    }
}
