import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    id: window
    x: 390
    width: 390
    height: 844
    visible: true

    Loader {
        id: loader
        anchors.fill: parent
    }

    Rectangle {
        id: background
        width: 420
        height: 844
        color: "#304437"

        Rectangle {
            id: circle
            radius: 360
            z: 0
            rotation: 90
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 670
            height: 670
            y: -24
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#689A78" }
                GradientStop { position: 0.37; color: "#3C5846" }
            }
        }

        Header {
            id: header
            x: 0
            y: 55
            property bool welcomeBackText: true
            property bool menuButton: true
        }

        Text {
            id: yourBalanceText
            text: "Your balance"
            color: "#BDBDBD"
            width: 191
            height: 63
            x: 27
            y: 167
            font.family: "Inter"
            font.weight: 400
            font.pixelSize: 14
            verticalAlignment: Text.AlignTop
        }

        Text {
            id: yourBalance
            color: "#EFEFEF"
            width: 191
            height: 63
            x: 27
            y: 167
            font.family: "Inter"
            font.weight: 700
            font.pixelSize: 32
            verticalAlignment: Text.AlignBottom
        }

        Rectangle {
            id: actions
            width: 341
            height: 86
            anchors.horizontalCenter: parent.horizontalCenter
            y: 281
            radius: 25
            color: "#FDFDFD"

            Rectangle {
                id: withdraw
                width: 68
                height: 52
                x: 32
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    id: withdrawRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image {
                        source: "qrc:/resources/withdrawIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: withdrawTextRect
                    width: 68
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    Text {
                        id: withdrawText
                        text: "Withdraw"
                        color: "#000000"
                        anchors.fill: parent
                        font.family: "Inter"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                MouseArea {
                    id: withdrawMouseArea
                    anchors.fill: parent
                    onClicked: {
                        loader.source = "WithdrawAmount.qml"
                        newScreenAnimation.start()
                    }
                }
            }

            Rectangle {
                id: deposit
                width: 45
                height: 52
                anchors.left: withdraw.right
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    id: depositRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image {
                        source: "qrc:/resources/depositIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: depositTextRect
                    width: 45
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    Text {
                        id: depositText
                        text: "Deposit"
                        color: "#000000"
                        anchors.fill: parent
                        font.family: "Inter"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                MouseArea {
                    id: depositMouseArea
                    anchors.fill: parent
                    onClicked: {
                        loader.source = "DepositAmount.qml"
                        newScreenAnimation.start()
                    }
                }
            }

            Rectangle {
                id: stats
                width: 57
                height: 52
                anchors.verticalCenter: deposit.verticalCenter
                anchors.left: deposit.right
                anchors.leftMargin: 23

                Rectangle {
                    id: statsRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image {
                        source: "qrc:/resources/statsIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: statsTextRect
                    width: 57
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    Text {
                        id: statsText
                        text: "Statistics"
                        color: "#000000"
                        anchors.fill: parent
                        font.family: "Inter"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                MouseArea {
                    id: statsMouseArea
                    anchors.fill: parent
                    onClicked: {
                        // Actions for statistics click can be defined here.
                    }
                }
            }

            Rectangle {
                id: send
                width: 44
                height: 52
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: stats.right
                anchors.leftMargin: 23

                Rectangle {
                    id: sendRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image {
                        source: "qrc:/resources/sendIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: sendTextRect
                    width: 30
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    Text {
                        id: sendText
                        text: "Send"
                        color: "#000000"
                        anchors.fill: parent
                        font.family: "Inter"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                MouseArea {
                    id: sendMouseArea
                    anchors.fill: parent
                    onClicked: {
                        loader.source = "SendMoney.qml"
                        newScreenAnimation.start()
                    }
                }
            }
        }

        Rectangle {
            id: whiteRectangle
            width: parent.width
            height: 446
            x: 0
            y: 388
            radius: 43
            color: "#FDFDFD"

            Text {
                id: recentTransactionsText
                text: "Recent Transactions"
                width: 209
                height: 28
                x: 15
                y: 21
                font.family: "Inter"
                font.weight: 600
                font.pixelSize: 20
                color: "#000000"
            }

            Rectangle {
                id: seeAllButton
                width: 45
                height: 13
                x: 314
                y: 445

                Text {
                    id: seeAllText
                    anchors.fill: parent
                    text: "See all"
                    font.family: "Inter"
                    font.weight: 600
                    font.pixelSize: 14
                    font.underline: true
                }

                MouseArea {
                    id: seeAllMouseArea
                    anchors.fill: parent
                    onClicked: {
                        loader.source = "TransactionsPage.qml"
                        newScreenAnimation.start()
                    }
                }
            }

            ColumnLayout {
                id: recentTransactions
                spacing: 27
                x: 0
                y: 55
                width: 420
                height: 308
                visible: true
                z: 10



                Repeater {
                    id: transactionsRepeater
                    model: Math.min(SessionHandler.transactions.length, 4)
                    visible: true

                    TransactionBlock {
                        required property int index
                        property string amount: SessionHandler.transactions[SessionHandler.transactions.length - index - 1].transactionAmount
                        property string interactor: SessionHandler.transactions[SessionHandler.transactions.length - index - 1].target
                        property string time: SessionHandler.transactions[SessionHandler.transactions.length - index - 1].timeProcessed
                        property string source: ":/resources/redArrowDown.png"
                        property string textColor: "red"

                        Component.onCompleted: {
                            console.log("Transaction:", amount, interactor, time);
                            SessionHandler.fetchTransactions(fluxo)
                        }
                    }
                }
            }
        }

        Navbar {
            id: navbar
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }

    NewScreenAnimation {
        id: newScreenAnimation
        target: loader.item
    }

    Connections {
            target: SessionHandler

            function onBalanceUpdated(newBalance) {
                yourBalance.text = newBalance;
            }

            function onTransactionDone() {
                if (SessionHandler.isTransactionDone) {
                    loader.source = "MainPage.qml";
                    newScreenAnimation.start();
                }
            }

            function onTransactionsChanged() {
                transactionsRepeater.model = Math.min(SessionHandler.transactions.length, 4);
            }



        }

        Component.onCompleted: {
            SessionHandler.fetchBalance(fluxo)
            SessionHandler.fetchTransactions(fluxo)
        }
    }
