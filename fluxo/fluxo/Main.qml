import QtQuick

Window {
    width: 390
    height: 844
    visible: true
    color: "#304437"
    title: qsTr("Hello World")

    Image {
        id: image
        x: 0
        y: 350
        width: 334
        height: 334
        source: "images/money_image.png"
        z: 3
        rotation: 0
        fillMode: Image.PreserveAspectFit


    }

    Rectangle {
        id: white_rectange
        x: 0
        y:425
        width: 390
        height: 426
        color: "#F1F1F1"
        radius: 43
    }

    Text {
        id: _text
        y: 470
        width: 303
        height: 93
        text: qsTr("Text")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
