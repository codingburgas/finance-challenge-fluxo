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


        Rectangle{
            id: circle
            radius: 360
            z: 0
            rotation: 90
            anchors.horizontalCenterOffset: -209
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:96
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                GradientStop {position: 0.37; color: "#3C5846"}
            }
        }

        Text{
            id: yourBalanceText

            text: "My budget"
            color: "#000000"

            width: 191
            height: 63
            x:70
            y:177
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 14
            verticalAlignment: Text.AlignTop
            z: 3
        }

        Text{
            id: yourBalance

            text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetAmountInserted
            color:"#000000"

            width: 191
            height: 63
            x:70
            y:170
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 700
            font.pixelSize: 32
            verticalAlignment: Text.AlignBottom
            z: 3
        }

        Header{
            id: header
            x:0
            y: 55
            property QtObject window: window
            property bool welcomeBackText: true
            property bool menuButton: true
        }

        Rectangle {
            id: rectangle
            x: 48
            y: 305
            width: 293
            height: 1
            color: "#000000"
            z: 2
            anchors.horizontalCenterOffset: -10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle1
            x: 61
            y: 341
            width: 120
            height: 70
            color: "#add8b9"
            radius: 6
            z: 1
            opacity: 0.42
        }






        Rectangle{
            id:actions
            width: 341
            height: 284
            anchors.horizontalCenter: parent.horizontalCenter
            y:157
            radius: 25
            anchors.horizontalCenterOffset: 1
            color: "#FDFDFD"
        }

        Rectangle{
            id: whiteRectangle
            width: parent.width
            height: 369
            x:0
            y:471
            radius: 43
            color: "#FDFDFD"

            Rectangle {
                id: rectangle2
                x: 159
                y: 102
                width: 102
                height: 102
                color: "#00ffffff"
                radius: 100
                border.color: "#304437"
                border.width: 2
                z: 3

                Text {
                    id: _text2
                    anchors.horizontalCenter: parent.horizontalCenter 
                    y: 32
                    color: "#304437"
                    text: (SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetAmountInserted / SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetGoal * 100).toFixed(0)
                    font.pixelSize: 29
                    z: 3
                    font.styleName: "Bold"
                }
            }

            Text {
                id: _text3
                x: 180
                y: 208
                text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetAmountInserted
                font.pixelSize: 12
                z: 3
            }

        }
        Text{
            id: recentTransactionsText
            text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetTitle
            width: 179
            height: 28
            x:121
            y:497

            font.family: "Inter"
            font.styleName: "Bold"
            font.weight: 700
            font.pixelSize: 18
            color: "#000000"
        }

        Rectangle {
            id: spendingButton
            x: 208
            y: 341
            width: 120
            height: 70
            opacity: 0.42
            color: "#e39c9c"
            radius: 6
            z: 2

        }

        Rectangle {
            id: withdrawButton
            x: 61
            y: 246
            width: 120
            height: 39
            opacity: 0.42
            color: "#add8b9"
            radius: 6
            z: 1

            Text {
                id: _text
                x: 51
                y: 11
                text: qsTr("Withdraw")
                font.pixelSize: 12
                font.styleName: "Bold"
            }

            MouseArea{
                id: withdrawMouseArea
                anchors.fill: parent
                onClicked: {
                    window.screenChanged("WithdrawAmount.qml")
                }
            }
        }

        Rectangle {
            id: depositButton
            x: 208
            y: 246
            width: 120
            height: 39
            opacity: 0.42
            color: "#add8b9"
            radius: 6
            z: 2

            Text {
                id: _text1
                x: 51
                y: 11
                text: qsTr("Deposit")
                font.pixelSize: 12
                font.styleName: "Bold"
            }

            MouseArea{
                id: depositMouseArea
                anchors.fill: parent
                onClicked: {
                    window.screenChanged("DepositAmount.qml")
                }
            }
        }

        Text {
            id: yourBalanceText1
            x: 40
            y: 538
            width: 191
            height: 18
            color: "#898989"
            text: "Budget Total"
            font.pixelSize: 12
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: yourBalance1
            x: 40
            y: 556
            width: 191
            height: 21
            color: "#000000"
            text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetGoal
            font.pixelSize: 18
            verticalAlignment: Text.AlignBottom
            z: 3
            font.weight: 700
            font.styleName: "normal"
            font.family: "Inter"
        }

        Rectangle {
            id: incomeIconBack
            x: 71
            y: 349
            width: 22
            height: 22
            color: "#ffffff"
            radius: 100
            z: 6
        }

        Text {
            id: incomeText
            x: 70
            y: 374
            width: 191
            height: 18
            color: "#898989"
            text: "Incomes"
            font.pixelSize: 11
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: income
            x: 71
            y: 384
            width: 191
            height: 21
            color: "#000000"
            text: "202.20 BGN"
            font.pixelSize: 14
            verticalAlignment: Text.AlignBottom
            z: 3
            font.weight: 700
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: spendingText
            x: 220
            y: 374
            width: 191
            height: 18
            color: "#898989"
            text: "Spendind"
            font.pixelSize: 11
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: spending
            x: 221
            y: 384
            width: 191
            height: 21
            color: "#000000"
            text: "2.20 BGN"
            font.pixelSize: 14
            verticalAlignment: Text.AlignBottom
            z: 3
            font.weight: 700
            font.styleName: "normal"
            font.family: "Inter"
        }

        Rectangle {
            id: spendingIconBack
            x: 221
            y: 349
            width: 22
            height: 22
            color: "#ffffff"
            radius: 100
            z: 6
        }

        Text {
            id: deadlineText
            x: 40
            y: 698
            width: 191
            height: 18
            color: "#898989"
            text: "Budget Deadline"
            font.pixelSize: 13
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: deadline
            x: 71
            y: 716
            width: 191
            height: 21
            color: "#000000"
            text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetDeadline
            font.pixelSize: 12
            verticalAlignment: Text.AlignBottom
            z: 3
            font.styleName: "Regular"
            font.family: "Inter"
        }

        Text {
            id: categoryText
            x: 267
            y: 698
            width: 191
            height: 18
            color: "#898989"
            text: "Category"
            font.pixelSize: 13
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: category
            x: 267
            y: 716
            width: 191
            height: 21
            color: "#000000"
            text: SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetCategory
            font.pixelSize: 12
            verticalAlignment: Text.AlignBottom
            z: 3
            font.styleName: "normal"
            font.family: "Inter"
        }

        Text {
            id: removeBudget
            x: 267
            y: 750
            width: 92
            height: 18
            color: "#82001f"
            text: "Remove budget"
            font.pixelSize: 13
            verticalAlignment: Text.AlignTop
            z: 3
            font.weight: 400
            font.underline: true
            font.styleName: "normal"
            font.family: "Inter"

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    CoreOperations.deleteBudget(SessionHandler.budgets[SessionHandler.activeBudgetIndex].budgetIndex)
                }
            }
        }

        Image {
            id: withdrawImg
            x: 75
            y: 253
            z: 3
            width: 25
            height: 25
            source: "qrc:/resources/withdrawIcon.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: depositImg
            x: 224
            y: 253
            z: 3
            width: 25
            height: 25
            source: "qrc:/resources/depositIcon.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: incomeIcon
            x: 77
            y: 354
            z: 7
            width: 10
            height: 10
            source: "qrc:/resources/incomeIcon.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: spendingsIcon
            z: 7
            width: 10
            height: 10
            x: 77
            y: 354
            source: "qrc:/resources/spendingsIcon.png"
            clip: true
            anchors.horizontalCenterOffset: 231
            anchors.horizontalCenter: circle.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

    }

    Image {
        id: budgetIcon
        x: 41
        y: 719
        z: 7
        width: 22
        height: 22
        source: "qrc:/resources/budgetIcon.png"
        fillMode: Image.PreserveAspectFit
    }
    Navbar{
    id: navbar
    property QtObject window: window
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -23
    }

    Connections{
        target: SessionHandler

        function onBudgetDeleted(){
            SessionHandler.fetchBudgets(fluxo)
        }


        function onBudgetsChanged(){
            window.screenChanged("BudgetCreateMenuPage.qml")
        }
    }


}
