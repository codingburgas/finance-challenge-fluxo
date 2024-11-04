import QtQuick 2.7
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3
import QtQuick.Window 2.15

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

        Rectangle {
            id: whiteRectange
            x: 1
            width: 390
            height: 667
            color: "#f1f1f1"
            radius: 43
            anchors.top: parent.top
            anchors.topMargin: 139
            z: 1

            Text {
                id: _text2
                x: 47
                y: 49
                text: SessionHandler.budgets[0].budgetTitle

                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 700
                font.pixelSize: 20
            }

            Rectangle {
                id: rectangle1
                anchors.horizontalCenter: parent.horizontalCenter
                y: 93
                width: 292
                height: 1
                color: "#000000"
            }

            Text {
                id: _text4
                anchors.horizontalCenter: parent.horizontalCenter
                y: 194
                text: qsTr("Budget Details")
                font.pixelSize: 16
                font.styleName: "Regular"
            }
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
                text: "Save"
                font.styleName: "SemiBold"
                font.pointSize: 19
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea{
                id: saveMouseArea
                anchors.fill: parent
                onClicked: {
                    SessionHandler.fetchBudget(SessionHandler.budgets[0].budgetId, fluxo)
                }
            }
        }

        Text {
            id: _text1
            x: 149
            y: 154
            color: "#000000"
            text: qsTr("Edit A <font color=\"#689A78\">Budget</font>")
            z: 1

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 700
            font.pixelSize: 16
        }

        TextField {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            y: 275
            width: 293
            height: 38
            z: 10
            background: Rectangle{
                width: 293
                radius: 8
                border.width: 1
                border.color: "#898989"
                color: "#ffffff"
            }

            placeholderText: qsTr("Amount")
            placeholderTextColor: "#898989"
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 20

            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: -11

            cursorDelegate: CursorRectangle{property QtObject textField: title}
        }

        Text {
            id: _text3
            x: 52
            y: 252
            width: 99
            height: 23
            visible: true
            color: "#898989"
            text: qsTr("Enter amount")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            z: 2
            font.styleName: "Regular"
        }

        ComboBox {
            id: categoryComboBox
            y: 391
            anchors.topMargin: 152
            anchors.horizontalCenter: parent.horizontalCenter
            width: 294
            height: 38

            currentIndex: -1
                displayText: (currentIndex === -1) ? "<font color=\"#898989\">Choose a category</font>" : currentText
                contentItem: Text{
                    text: categoryComboBox.displayText
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 11
                    elide: Text.ElideRight
                    textFormat: Text.RichText
                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 20
                }

            model: ["Food", "Education", "Transportation", "Bills", "Shopping", "Friends and Family", "Health"]

            font.pixelSize: 16
            z: 5
            anchors.horizontalCenterOffset: -11
            background: Rectangle {
                color: "#FDFDFD"
                border.color: "#898989"
                radius: 8
            }
        }

        TextField {
            id: dateInput
            anchors.horizontalCenter: parent.horizontalCenter
            y: 507
            width: 293
            height: 38
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
            anchors.horizontalCenterOffset: -11

            cursorDelegate: CursorRectangle{property QtObject textField: dateInput}
        }

        Text {
            id: _textDateLabel
            x: 52
            y: 483
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
            x: 54
            y: 367
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

    Header{
        id: header
        x:0
        y: 55
        property QtObject window: window
        property bool welcomeBackText: false
        property bool menuButton: true
    }

    Connections {
        target: SessionHandler

        function onBudgetsChanged(){
            window.screenChanged("BudgetMainMenu.qml")
        }
    }

}
