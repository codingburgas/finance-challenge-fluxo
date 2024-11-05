import QtQuick 2.7

Rectangle {

    /*
    params to be set:
    window: QtObject - object of a main rectangle in a file
    */
    id: navBar
    width: 484
    height: 95
    color: "#fdfdfd"
    radius: 43
    border.color: "#40000000"
    border.width: 1
    z: 2


    Rectangle{
        id: homeRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width: 25
        height: 25
        Image{
            id: homeImage
            anchors.fill: parent
            source: "qrc:/resources/homeIcon.png"
        }
        MouseArea{
            id: homeMouseArea
            anchors.fill: parent
            onClicked: {
                navBar.window.screenChanged("MainPage.qml")
            }
        }
    }

    Rectangle{
        id: receiptRect
        width: 25
        height: 25
        x: homeRect.x-104
        anchors.verticalCenter: parent.verticalCenter
        Image{
            id: receiptImage
            anchors.fill: parent
            source: "qrc:/resources/receiptIcon.png"
        }
        MouseArea{
            id: receiptMouseArea
            anchors.fill: parent
            onClicked: {
                navBar.window.screenChanged("TransactionsPage.qml")
            }
        }
    }

    Rectangle{
        id: savingsRect
        x: homeRect.x+104
        anchors.verticalCenter: parent.verticalCenter

        width: 25
        height: 25
        Image{
            id: savingsIcon
            anchors.fill: parent
            source: "qrc:/resources/savingsIcon.png"
        }
        MouseArea{
            id: savingsMouseArea
            anchors.fill: parent
            onClicked: {
                //SessionHandler.fetchBudgets(fluxo)
                navBar.window.screenChanged("BudgetCreateMenuPage.qml")
            }
        }
    }

    Connections{
        target: SessionHandler

        /*function onBudgetsChanged(){
            navBar.window.screenChanged("BudgetCreateMenuPage.qml")
        }*/
    }

}

