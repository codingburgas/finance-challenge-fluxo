import QtQuick 2.7
import QtQuick.Controls


Window {
    id: window
    width: 390
    height: 844
    visible: true

    /*//property to save budget id, when it's clicked
    property string budgetId*/

    property string currentFile: "GetStartedPage.qml"
    property string nextFile: ""
    property Rectangle currentPage: GetStartedPage{}
    property Rectangle nextPage


    property NewPageShowAnimation showAnimation: NewPageShowAnimation{
        property QtObject stackView: window
    }

    property NewPageHideAnimation hideAnimation: NewPageHideAnimation{
        property QtObject stackView: window
    }

    /*function putOnIndex(item, index){
        if (index < stackView.count-1){
            stackView.addItem(item)
        } else{
            stackView.insertItem(index, item)
        }
    }*/

    Component.onCompleted: {
        currentPage = Qt.createComponent( Qt.resolvedUrl(currentFile) ).createObject(window, {x:0, y:0})
    }


    Connections{
        target: window.currentPage
        //checks if user clicked sth, which is supposed to enter new page
        function onScreenChanged(path){

            if (window.currentFile != path){
                window.nextFile = path
                //create new component from path given and convert it into object
                let newComponent = Qt.createComponent( Qt.resolvedUrl(path) )

                if (window.currentFile == "MainPage.qml"){

                    window.nextPage = newComponent.createObject(window, {x:window.width/2, z:2})

                    window.showAnimation.restart()

                } else{

                    if (window.nextFile == "MainPage.qml"){
                        window.nextPage = newComponent.createObject(window, {z:0})
                        window.hideAnimation.restart()

                    } else {

                        window.nextPage = newComponent.createObject(window, {x:window.width/2, z:2})
                        window.showAnimation.restart()

                    }
                }

            }

        }


        /*function onBudgetClicked(id){
            window.budgetId = id
        }*/
    }

    Connections{
        target: window.showAnimation

        function onFinished(){
            window.currentPage.destroy()
            window.currentPage = window.nextPage
            window.currentPage.z = 1

            window.currentFile = window.nextFile
            window.nextFile=""
        }
    }

    Connections{
        target: window.hideAnimation

        function onFinished(){
            window.currentPage.destroy()
            window.currentPage = window.nextPage
            window.currentPage.z = 1

            window.currentFile = window.nextFile
            window.nextFile=""
        }
    }
}
