import QtQuick 2.7
import QtQuick.Controls 2.2


Window{
    
    width: 390
    height: 844
    visible: true
    
    Rectangle {
        id: getStartedPage
        width: 390
        height: 844
        visible: true
        color: "#304437"
        
    
        Image {
            id: moneyImage
    
            x: 0
            y: 200
            width: 334
            height: 334
            source: "https://raw.githubusercontent.com/codingburgas/finance-challenge-fluxo/refs/heads/dev/fluxoapp/resources/money_image.png?token=GHSAT0AAAAAACZKIOCQZ4K3AP55K7HXAHFMZYYVOZQ"
            z: 3
            rotation: 0
            fillMode: Image.PreserveAspectFit
    
    
        }
    
        Rectangle {
            id: whiteRectange
            x: 0
            y:425
            width: 390
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
            font.pixelSize: 26
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    
        Text {
            id: textAdditional
            width: 278
            height: 61
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            y: 588
    
            font.pixelSize: 16
            text: "<font color=\"#505050\">Money management has never been</p>easier before, start your journey now</p>and see the difference."
    
    
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
    
            Text{
                id: buttonText
                text: "Get started"
                color: "#f1f1f1"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 20
                font.bold: true
            }
    
            MouseArea{
                id: buttonMouseArea
                anchors.fill: parent
                onClicked:{
                    /*make next page visible*/
                    animateFlow.start()
                }
            }
            
            NumberAnimation {
                id: animateFlow
                target: getStartedPage
                properties: "x"
                from: 0
                to: -390
                easing {type: Easing.OutBack; }
                duration: 500
           } 
    
        }
    }
}