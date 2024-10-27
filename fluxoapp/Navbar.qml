import QtQuick 2.7

Rectangle {
    id: navBar
    width: 484
    height: 95
    color: "#fdfdfd"
    radius: 43
    z: 2

    Rectangle{
        id: homeRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width: 25
        height: 25
        Image{
            id: homeImage
            anchors.fill: parent
            source: "qrc:/resources/homeIcon.png"
        }
        MouseArea{
            id: homeMouseArea
            anchors.fill: parent
        }
    }

    Rectangle{
        id: receiptRect
        width: 25
        height: 25
        x: homeRect.x-104
        anchors.verticalCenter: parent.verticalCenter
        Image{
            id: receiptImage
            anchors.fill: parent
            source: "qrc:/resources/receiptIcon.png"
        }
        MouseArea{
            id: receiptMouseArea
            anchors.fill: parent
        }
    }

    Rectangle{
        id: savingsRect
        x: homeRect.x+104
        anchors.verticalCenter: parent.verticalCenter

        width: 25
        height: 25
        Image{
            id: savingsIcon
            anchors.fill: parent
            source: "qrc:/resources/savingsIcon.png"
        }
        MouseArea{
            id: savingsMouseArea
            anchors.fill: parent
        }
    }
}

