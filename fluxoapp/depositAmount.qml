import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    width: 420
    height: 900
    visible: true

    Loader{
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
            anchors.topMargin: 99
        }

        Rectangle {
            id: circle
            radius: 360
            z: 0
            rotation: 90
            anchors.horizontalCenterOffset: -263
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y: -24
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#689A78" }
                GradientStop { position: 0.37; color: "#3C5846" }
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
            id: whiteRectangle
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
                y: 72
                readOnly: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignJustify
                verticalAlignment: Text.AlignVCenter
                background: Rectangle {
                    color: "#ffffff"
                    radius: 8
                    border.color: "#d3d3d3"
                }
            }

            GridLayout {
                id: keypadLayout
                width: 301
                height: 251
                columns: 3
                rowSpacing: 20
                columnSpacing: 10
                anchors.horizontalCenter: inputField.horizontalCenter
                anchors.top: inputField.bottom
                anchors.topMargin: 41

                Repeater {
                    model: [
                                            { text: "    1" }, { text: "    2" }, { text: "    3" },
                                            { text: "    4" }, { text: "    5" }, { text: "    6" },
                                            { text: "    7" }, { text: "    8" }, { text: "    9" },
                                            { text: "    ." }, { text: "    0" }, { text: "    <", isBackspace: true }
                                        ]

                                    delegate: Button {
                                        text: modelData.text === "." ? modelData.text : modelData.text.trim()
                                        width: 110
                                        height: 54
                                        font.pixelSize: 20
                                        background: Rectangle {
                                            color: modelData.color
                                            width: parent.width + 20
                                            height: parent.height
                                            radius: 16
                                            border.color: "#d3d3d3"
                                            }

                                            contentItem: Text {
                                                text: modelData.text
                                                anchors.centerIn: parent
                                                font.pixelSize: 19
                                                color: "#101828"
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

                            Text {
                                id: textEdit
                                x: 40
                                y: 21
                                width: 80
                                height: 20
                                text: qsTr("Deposit")
                                font.pixelSize: 23
                                font.styleName: "SemiBold"
                            }
        }

        Rectangle {
            id: buttonRectangle
            y: 64
            width: 208
            height: 58
            color: "#3c5846"
            radius: 13
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 90
            z: 2
            anchors.horizontalCenterOffset: 0

            Text {
                id: buttonText
                color: "#f1f1f1"
                text: "Next"
                font.styleName: "Light"
                font.pointSize: 19
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onClicked: {
                    loader.source = "depositCategory.qml";
                    CoreOperations.deposit(inputField.text, fluxo);
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

