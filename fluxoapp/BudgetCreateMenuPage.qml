import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Rectangle {
    id: window
    width: 380
    height: 844
    visible: true

    signal screenChanged(file: string)

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
            height: 518
            x:0
            y:334
            radius: 43
            color: "#FDFDFD"


        }

        Image{
            source: "qrc:/resources/handWithCoins.png"

            x:104
            y:85

            width: 331
            height: 331

        }


        Text{
            id: creatingBudgetText
            text: "<font color=\"#000000\">Creating A</font> <font color=\"#689A78\">Budget</font>"

            anchors.horizontalCenter: parent.horizontalCenter
            y: 379

            width: 303
            height: 31


            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 700
            font.pixelSize: 26
            horizontalAlignment: Text.AlignHCenter
        }

        ScrollView{
            id: budgets
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            anchors.horizontalCenter: parent.horizontalCenter
            y: 472

            width: 294
            height: 293


            ColumnLayout{
                spacing: 31

                Rectangle{
                    id: blank
                    Layout.preferredWidth: 294
                    Layout.preferredHeight: 92
                    radius: 20
                    color: "#F1F1F1"

                    Image{
                        source: "qrc:/resources/plusBudgetIcon.png"
                        width: 55
                        height: 55
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        id: createBudgetMouseArea
                        anchors.fill: parent
                        onClicked: {
                            window.screenChanged("BudgetData.qml")
                        }
                    }
                }

                Repeater{
                    model: 10
                    BudgetBlock{
                        property QtObject window: window
                        property string name: "Dream Laptop"
                        property string category: "Education"
                        property string outOf: "200/2000 BGN"
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

}
