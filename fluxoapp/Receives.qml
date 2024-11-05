import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

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
            anchors.horizontalCenterOffset: 263
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:-24
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                GradientStop {position: 0.37; color: "#3C5846"}
            }
        }

        Header{
            id: header
            x:0
            y: 55
            property QtObject window: window
            property bool welcomeBackText: true
            property bool menuButton: true
        }

        Rectangle{
            id: whiteRectangle
            width: parent.width
            height: 633
            x:0
            y:201
            radius: 43
            color: "#FDFDFD"


        }
        Text{
            id: transactionListText
            text: "Transaction List"
            width: 209
            height: 28
            x:27
            y:223

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 600
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            color: "#000000"

        }

        Rectangle{
            id: expensesRect
            width: 76
            height: 12
            anchors.horizontalCenter: parent.horizontalCenter
            y:268

            Text{
                id: expensesText
                text: "Expenses"
                anchors.fill: parent


                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 600
                font.pixelSize: 14
                color: "#000000"

            }

            MouseArea{
                id: expensesMouseArea
                anchors.fill: parent
                onClicked:{
                    window.screenChanged("Expenses.qml")
                }
            }
        }

        Rectangle{
            id: allRect
            width: 20
            height: 12
            anchors.right: expensesRect.left
            anchors.rightMargin: 68
            y:268

            Text{
                id: allText
                text: "All"
                anchors.fill: parent

                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 600
                font.pixelSize: 14
                color: "#000000"


            }

            MouseArea{
                id: allMouseArea
                anchors.fill: parent
                onClicked:{
                    window.screenChanged("TransactionsPage.qml")
                }
            }
        }

        Rectangle{
            id: receivesRect
            width: 76
            height: 12
            anchors.left: expensesRect.right
            anchors.leftMargin: 56
            y:268

            Text{
                id: receivesText
                text: "Receives"
                anchors.fill: parent


                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 600
                font.pixelSize: 14
                color: "#000000"

            }

            MouseArea{
                id: receivesMouseArea
                anchors.fill: parent
                onClicked:{
                    window.screenChanged("Receives.qml")
                }


            }
        }

        ScrollView{
            id: transactions
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            x:0
            y:317
            width: parent.width
            height: 527

            ColumnLayout{
                x: 24

                spacing: 22

                Repeater{
                    id: transactionsRepeater
                    model: SessionHandler.transactions.length

                    TransactionBlock{

                        function isExpense(type){
                            if (type=="WITHDRAW"){return true;}
                            if (type=="DEPOSIT"){return false;}
                            if (type.includes("BUDGET:WITHDRAW")){return false;}
                            if (type.includes("BUDGET:DEPOSIT")){return true;}
                            if (transaction.target == SessionHandler.getUsername()){
                                return false;
                            }else{
                                return true;
                            }
                            return false;
                        }

                        required property int index
                        property QtObject transaction: SessionHandler.transactions[SessionHandler.transactions.length - index - 1]
                        visible: !isExpense(transaction.type)
                        property string amount: transaction.transactionAmount
                        property string interactor: transaction.target
                        property string time: transaction.timeProcessed
                        //property string source: (transaction.type == "WITHDRAW")? "qrc:/resources/redArrowDown.png" : "qrc:/resources/greenArrowUp.png"
                        property string source: (isExpence(transaction.type))? "qrc:/resources/redArrowDown.png" : "qrc:/resources/greenArrowUp.png"
                        property string textColor: (isExpence(transaction.type))? "red" : "notRed"
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

    Connections {
            target: SessionHandler

            function onTransactionsChanged() {
                transactionsRepeater.model = SessionHandler.transactions.length;
            }



        }

        Component.onCompleted: {
            SessionHandler.fetchTransactions(fluxo)
        }

}
