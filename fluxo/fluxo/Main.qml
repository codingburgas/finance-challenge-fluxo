import QtQuick 2.7
import QtQuick.Controls 2.2

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
        text: "<font color=\"#000000\">Best</font> <font color=\"#689A78\">Financial</p>Management System</font><font color=\"#000000\"></p>for You.</font>"
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
    
    Text {
        width: 278
        height: 61
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        y: 588
        
        font.pixelSize: 16
        text: "<font color=\"#505050\">Money management has never been</p>easier before, start your journey now</p>and see the difference."
        
        
    }
}