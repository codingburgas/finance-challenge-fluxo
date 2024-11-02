import QtQuick 2.7

Rectangle{
    id: transactionBlock
    width: 356
    height: 41

    Rectangle{
        id: transactionImageRect
        width: 41
        height: 41
        x: 0
        y:0

        Image{
            source: transactionBlock.source
            anchors.fill: parent
        }

    }

    Rectangle{
        id: transactionTextRect
        width: 100
        height: 29
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: transactionImageRect.right
        anchors.leftMargin: 9

        Text{
            id: transactionInteractorText
            text: transactionBlock.interactor

            anchors.top: parent.top

            width: 100
            height: 16


            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 600
            font.pixelSize: 14
            color: "#000000"
            elide: Text.ElideRight // adds 3 dots at the end, if text goes out of Text block
        }

        Text{
            id: transactionTimeText
            text: transactionBlock.time

            width: 57
            height: 11

            anchors.bottom: parent.bottom

            font.family: "Inter"
            font.styleName: "normal"
            font.weight: 300
            font.pixelSize: 11
        }

    }

    Text{
        id: transactionAmount
        text: (transactionBlock.textColor=="red" ? "-":"") + transactionBlock.amount + " BGN"

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        width: 87
        height: 14

        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 500
        font.pixelSize: 14
        color: (transactionBlock.textColor=="red") ? "#E39C9C" : "ADD8B9"
        elide: Text.ElideRight
    }
}
