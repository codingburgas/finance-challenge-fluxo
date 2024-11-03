import QtQuick 2.7

SequentialAnimation{
    /*when old page shrink and underneath is left new one*/
    id: animation
    property int duration: 350

    PropertyAction {
        target: animation.stackView.nextPage;
        property: "visible"
        value: true
    }

    ParallelAnimation {

        NumberAnimation {
            target: animation.stackView.currentPage
            property: "scale"
            from: 1.0
            to: 0
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: animation.stackView.currentPage
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: animation.stackView.currentPage
            property: "x"
            from: 0
            to: animation.stackView.currentPage.x
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: animation.stackView.currentPage
            property: "y"
            from: 0
            to: animation.stackView.height
            duration: animation.duration
            easing.type: Easing.InOutQuad
        }
    }

}
