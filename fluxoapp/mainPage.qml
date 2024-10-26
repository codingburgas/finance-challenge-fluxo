import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    id: window
    width: 420
    height: 900
    visible: true

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

        Rectangle {
            id: profilePic
            x: 20
            y: 56
            width: 42
            height: 42
            color: "#d4de67"
            radius: 50
        }

        Text {
            id: greetingText
            x: 71
            y: 62
            width: 193
            height: 23

            color: "#ffffff"
            text: qsTr("Hi There, ")
            font.letterSpacing: 0.02
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 600
            font.pixelSize: 14
        }

        Text {
            id: welcomeBackText
            x: 71
            y: 82
            width: 127
            height: 13

            color: "#ffffff"
            text: qsTr("Welcome back to Fluxo")
            font.letterSpacing: 0.02
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 300
            font.pixelSize: 11
        }

        Rectangle{
            id: menu
            x: window.width*0.875
            y: 56
            width: 30
            height: 30
            color: "#00ffffff"

            ColumnLayout{
                anchors.centerIn: parent
                Rectangle{
                    id: line1
                    Layout.preferredWidth: 22.5
                    Layout.preferredHeight: 3
                    border.width: 7
                }
                Rectangle{
                    id: line2
                    Layout.preferredWidth: 22.5
                    Layout.preferredHeight: 3
                    border.width: 7
                }
                Rectangle{
                    id: line3
                    Layout.preferredWidth: 22.5
                    Layout.preferredHeight: 3
                    border.width: 7
                }
            }


        }


        Text{
            id: yourBalanceText

            text: "Your balance"
            color: "#BDBDBD"

            width: 191
            height: 63
            x:27
            y:167
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 400
            font.pixelSize: 14
            verticalAlignment: Text.AlignTop
        }
        Text{
            id: yourBalance

            text: "122.23 BGN"
            color:"#EFEFEF"

            width: 191
            height: 63
            x:27
            y:167
            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 700
            font.pixelSize: 32
            verticalAlignment: Text.AlignBottom
        }

        Rectangle{
            id:actions
            width: 341
            height: 86
            anchors.horizontalCenter: parent.horizontalCenter
            y:281
            radius: 25
            color: "#FDFDFD"

            Rectangle{
                id:withdraw
                width: 68
                height:52
                x:32
                anchors.verticalCenter: parent.verticalCenter

                Rectangle{
                    id:withdrawRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image{
                        source: ":/resources/withdrawIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: withdrawTextRect
                    width: 68
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    Text{
                        id: withdrawText

                        text: "Withdraw"
                        color: "#000000"

                        anchors.fill: parent

                        font.family: "Inter"
                        font.styleName: "normal"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }



                MouseArea{
                    id: withdrawMouseArea
                    anchors.fill: parent
                }

            }
            Rectangle{
                id:deposit
                width: 45
                height:52

                anchors.left: withdraw.right
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter

                Rectangle{
                    id:depositRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image{
                        source: ":/resources/depositIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: depositTextRect
                    width: 45
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    Text{
                        id: depositText

                        text: "Deposit"
                        color: "#000000"

                        anchors.fill: parent

                        font.family: "Inter"
                        font.styleName: "normal"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }



                MouseArea{
                    id: depositMouseArea
                    anchors.fill: parent
                }

            }
            Rectangle{
                id:stats
                width: 57
                height:52
                anchors.verticalCenter: deposit.verticalCenter
                anchors.left: deposit.right
                anchors.leftMargin: 23


                Rectangle{
                    id:statsRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image{
                        source: ":/resources/statsIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: statsTextRect
                    width: 57
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    Text{
                        id: statsText

                        text: "Statistics"
                        color: "#000000"

                        anchors.fill: parent

                        font.family: "Inter"
                        font.styleName: "normal"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }



                MouseArea{
                    id: statsMouseArea
                    anchors.fill: parent
                }

            }
            Rectangle{
                id:send
                width: 44
                height:52
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: stats.right
                anchors.leftMargin: 23

                Rectangle{
                    id:sendRect
                    width: 44
                    height: 39
                    color: "#6badd8b9"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    radius: 6

                    Image{
                        source: ":/resources/sendIcon.png"
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: sendTextRect
                    width: 30
                    height: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    Text{
                        id: sendText

                        text: "Send"
                        color: "#000000"

                        anchors.fill: parent

                        font.family: "Inter"
                        font.styleName: "normal"
                        font.weight: 600
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }
                }



                MouseArea{
                    id: sendMouseArea
                    anchors.fill: parent
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
}
