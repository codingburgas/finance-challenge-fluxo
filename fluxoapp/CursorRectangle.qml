import QtQuick 2.7

Rectangle {

    id: cursor
    visible: false
    color: "#000000"
    width: textField.cursorRectangle.width

    SequentialAnimation {
        loops: Animation.Infinite
        running: textField.cursorVisible

        PropertyAction {
            target: cursor
            property: 'visible'
            value: true
        }

        PauseAnimation {
            duration: 600
        }

        PropertyAction {
            target: cursor
            property: 'visible'
            value: false
        }

        PauseAnimation {
            duration: 600
        }

        onStopped: {
            cursor.visible = false
        }
    }
}
