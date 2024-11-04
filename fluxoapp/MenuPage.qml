import QtQuick 2.7
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


        Header{
            id: header
            x:0
            y: 55
            property QtObject window: window
            property bool welcomeBackText: true
            property bool menuButton: false
            z:1
        }

        Rectangle{
            id: circle1
            radius: 360
            z: 0
            rotation: 164

            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -345
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -345
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                GradientStop {position: 0.37; color: "#3C5846"}
            }
        }

        Rectangle{
            id: circle2
            radius: 360
            z: 0
            rotation: -90

            width: 670
            height: 670
            x:140
            y:95
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                GradientStop {position: 0.37; color: "#3C5846"}
            }
        }

        Rectangle{
            id: whiteRectangle

            anchors.horizontalCenter: parent.horizontalCenter
            y: 118

            width: 346
            height: 558

            color: "#FDFDFD"
            radius: 43
        }

        Text{
            id: menuText
            text: "Menu"

            anchors.horizontalCenter: parent.horizontalCenter
            y: 140

            width: 55
            height: 24

            color: "#000000"

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 600
            font.pixelSize: 20
        }



        ColumnLayout{
            id: options
            x: 65
            y :184
            spacing: 16

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:homeImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/homeIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: homeText
                    text: "Home"

                    anchors.left: homeImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: homeMouseArea
                    anchors.fill: parent
                    onClicked: {
                        window.screenChanged("MainPage.qml")
                    }

                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:budgetImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/savingsIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: budgetText
                    text: "Budget"

                    anchors.left: budgetImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: budgetMouseArea
                    anchors.fill: parent
                    onClicked: {
                        SessionHandler.fetchBudgets(fluxo)
                    }

                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:withdrawImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/withdrawIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: withdrawText
                    text: "Withdraw"

                    anchors.left: withdrawImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: withdrawMouseArea
                    anchors.fill: parent
                    onClicked: {
                        window.screenChanged("WithdrawAmount.qml")
                    }
                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:depositImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/depositIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: depositText
                    text: "Deposit"

                    anchors.left: depositImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: depositMouseArea
                    anchors.fill: parent

                    onClicked: {
                        window.screenChanged("DepositAmount.qml")
                    }

                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:sendImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/sendIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: sendText
                    text: "Send Money"

                    anchors.left: sendImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: sendMouseArea
                    anchors.fill: parent

                    onClicked: {
                        window.screenChanged("SendMoney.qml")
                    }
                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:statsImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/statsIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: statsText
                    text: "Statistics"

                    anchors.left: statsImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: statsMouseArea
                    anchors.fill: parent

                    onClicked: {
                        window.screenChanged("Statistics.qml")
                    }
                }
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:transactionsImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/receiptIcon.png"
                        anchors.centerIn: parent
                    }


                }

                Text{
                    id: transactionsText
                    text: "Transactions"

                    anchors.left: transactionsImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: transactionsMouseArea
                    anchors.fill: parent

                    onClicked: {
                        window.screenChanged("TransactionsPage.qml")
                    }
                }
            }

            Item{
                id: spacer
                Layout.preferredHeight: 7
            }

            Rectangle{
                Layout.preferredWidth: 210
                Layout.preferredHeight: 36

                color: "#00ffffff"


                Rectangle{
                    id:privacyPolicyImageRect
                    width: 38
                    height: 36
                    color: "#fdfdfd"
                    anchors.left: parent.left
                    radius: 3

                    Image{
                        source: "qrc:/resources/homeIcon.png"
                        anchors.centerIn: parent
                    }


                }


                Text{
                    id: privacyPolicyText
                    text: "Privacy Policy"

                    anchors.left: privacyPolicyImageRect.right
                    anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter

                    width: 158
                    height: 22


                    font.family: "Inter"
                    font.styleName: "normal"
                    font.weight: 400
                    font.pixelSize: 14
                }

                MouseArea{
                    id: privacyPolicyMouseArea
                    anchors.fill: parent

                    onClicked: {
                        window.screenChanged("PrivacyPolicy.qml")
                    }
                }
            }
        }


        Navbar{
            id: navbar
            property QtObject window: window
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
        }
    }


    Connections{
        target: SessionHandler

        function onBudgetsChanged(){
            window.screenChanged("BudgetCreateMenuPage.qml")
        }
    }
}
