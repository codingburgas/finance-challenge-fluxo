import QtQuick 2.7
import QtQuick.Controls


Window {
    id: window
    width: 390
    height: 844
    visible: true


    StackView{
        id: stackView
        width: 390
        height: 844
        anchors.fill: parent
        pushEnter: Transition {
            NewScreenAnimation{

            }
        }

        initialItem: "GetStartedPage.qml"


    }

    Connections{
        target: stackView.currentItem
        function onScreenChanged(path){
            stackView.replace(Qt.resolvedUrl(path), StackView.ReplaceTransition)
        }
    }
}
