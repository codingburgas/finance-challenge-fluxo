import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id: window
    width: 420
    height: 844
    visible: true

    signal screenChanged(file: string)

    Rectangle {
        id: background
        anchors.fill: parent
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
            id: whiteRectange
            width: 420
            height: 633
            color: "#f1f1f1"
            radius: 43
            anchors.top: parent.top
            anchors.topMargin: 211
            z: 1

            TextField {
                id: inputField
                width: 300
                height: 50
                x: 60
                y: 53
                readOnly: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                placeholderText: qsTr("Amount")
                placeholderTextColor: "#898989"
                background: Rectangle {
                    color: "#FFFFFF"
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
                            color: "#ffffff"
                            width: parent.width + 20
                            height: parent.height
                            radius: 16
                            border.color: "#d3d3d3"

                            Behavior on color {
                                ColorAnimation { duration: 150 }
                            }
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

                        onPressed: {
                            background.color = "#e0e0e0"
                            scale = 0.95
                        }

                        onReleased: {
                            background.color = "#ffffff"
                            scale = 1.0
                        }

                        Behavior on scale {
                            NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
                        }
                    }
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
                text: "Create"
                font.styleName: "SemiBold"
                font.pointSize: 19
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea{
                id: createMouseArea
                anchors.fill: parent
                onClicked: {
                    CoreOperations.createBudget(inputField.text, fluxo, SessionHandler)
                    window.screenChanged("BudgetMainMenu.qml")
                }
            }
        }

        Text {
            id: _text1
            anchors.horizontalCenter: parent.horizontalCenter
            y: 121
            color: "#ffffff"
            text: qsTr("Creating a budget")
            font.pointSize: 22
            font.styleName: "SemiBold"
        }
        Navbar{
            id: navbar
            property QtObject window: window
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
        }
    }

}
