import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Window {
    id: window
    width: 390
    height: 844
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
            }
        }

        ScrollView{
            id: transations
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            x:0
            y:317
            width: parent.width
            height: 527

            ColumnLayout{
                x: 24

                spacing: 22
                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }

                TransactionBlock{
                    property string amount: "-68.90 BGN"
                    property string interactor: "Mariq Koleva"
                    property string source: "qrc:/resources/redArrowDown.png"
                    property string textColor: "red"
                    property string time: "8:20 AM"
                }
            }



        }



        Navbar{
            id: navbar
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
        }

    }

}
