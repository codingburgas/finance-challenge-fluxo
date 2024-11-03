import QtQuick 2.7

SequentialAnimation{
    id: animation
    /*when new page appear and expands to fullscreen*/
    property int duration: 450

    ParallelAnimation {

        NumberAnimation {
            target: animation.stackView.nextPage
            property: "scale"
            from: 0.0
            to: 1
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: animation.stackView.nextPage
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: animation.stackView.nextPage
            property: "x"
            from: animation.stackView.currentPage.x
            to: 0
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: animation.stackView.nextPage
            property: "y"
            from: animation.stackView.height
            to: 0
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
    }

    PropertyAction {
        target: animation.stackView.currentPage;
        property: "visible"
        value: false
    }



}
