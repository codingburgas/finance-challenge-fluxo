import QtQuick 2.7


Window {
    id: window
    width: 380
    height: 844
    visible: true

    Rectangle {
        id: getStartedPage
        anchors.fill: parent // Ensures the Rectangle fills the Window exactly
        color: "#304437"

        Rectangle{
            id: circle
            radius: 360
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y:174
            gradient: Gradient {
                    GradientStop {position: 0.0; color: "#689A78"}
                    GradientStop {position: 0.37; color: "#3C5846"}
                }
        }

        Image {
            id: moneyImage
            source: ":/resources/money_image.png"
            x: 10
            y: 192
            width: 362
            height: 362
            z: 3
            rotation: 0
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: whiteRectangle
            anchors.left: parent.left // Anchors to the parent Rectangle
            anchors.right: parent.right // Ensure no overflow on the right
            y: 425
            height: 426
            color: "#F1F1F1"
            radius: 43
        }

        Text {
            id: textMain
            y: 470
            width: 303
            height: 93
            text: "<font color=\"#000000\">Best</font> <font color=\"#689A78\">Financial</p>Management System</font><font color=\"#000000\"></p>for You.</font>"

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 700
            font.pixelSize: 26

        }

        Text {
            id: textAdditional
            width: 278
            height: 61
            horizontalAlignment: Text.AlignHCenter
            z: 2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 588

            text: "<font color=\"#505050\">Money management has never been</p>easier before, start your journey now</p>and see the difference."

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 300
            font.pixelSize: 16
        }

        Rectangle {
            id: buttonRectangle
            anchors.horizontalCenter: parent.horizontalCenter
            y: 723
            z: 3
            width: 208
            height: 58
            color: "#3C5846"
            radius: 13

            Text {
                id: buttonText
                text: "Get started"
                color: "#f1f1f1"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 20
                font.bold: true

                font.family: "Inter"
                font.styleName: "normal"
                font.weight: 700
                font.pixelSize: 20
            }

            MouseArea {
                id: buttonMouseArea
                anchors.fill: parent
            }
        }

    }
}
