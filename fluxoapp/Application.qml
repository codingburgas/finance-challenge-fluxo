import QtQuick 2.7
import QtQuick.Controls


Window {
    id: window
    width: 390
    height: 844
    visible: true


    StackView{
        id: stackView
        anchors.fill: parent

        replaceEnter: Transition {
            NumberAnimation { property: "x"; from: stackView.width; to: 0; duration: 300; easing.type: Easing.InOutQuad }
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 300 }
        }

        replaceExit: Transition {
            NumberAnimation { property: "x"; from: 0; to: -stackView.width; duration: 300; easing.type: Easing.InOutQuad }
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 300 }
        }

        initialItem: GetStartedPage{/*anchors.fill: parent*/}


    }

    Connections{
        target: stackView.currentItem
        function onScreenChanged(path){
            stackView.replace(Qt.resolvedUrl(path), StackView.PushTransition)
            //stackView.currentItem.anchors.fill = stackView
        }
    }
}
