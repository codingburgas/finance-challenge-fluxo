import QtQuick 2.7

NumberAnimation {
    /*
    params to be set:
    target: QtObject - object, which animation is applied to
    */
    id: newScreenAnimation
    property: "x"
    from: 390
    to: 0
    duration: 200
    easing.type: Easing.Linear
}
