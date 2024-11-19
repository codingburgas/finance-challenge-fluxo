import QtQuick 2.7
import QtQuick.Controls 2.2
//import QtQuick.Layouts 1.3
import QtQuick.Window 2.15

Rectangle {
    id: window
    width: 420
    height: 844
    visible: true

    signal screenChanged(file: string)

    Rectangle {
        id: getStartedPage
        anchors.fill: parent
        color: "#304437"

        Rectangle{
            id: circle
            radius: 360
            //anchors.horizontalCenterOffset: -100
            rotation: 115.75
            width: 670
            height: 670
            //anchors.horizontalCenter: parent.horizontalCenter
            x: -421
            y:-139
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#689A78"}
                    GradientStop {position: 0.37; color: "#3C5846"}
                }
        }

        Rectangle {
            id: whiteRectangle
            anchors.left: parent.left
            anchors.right: parent.right
            y: 233
            height: 796
            color: "#F1F1F1"
            radius: 43
        }



    }

    Text {
            id: statsTitle
            x: 138
            y: 167
            color: "#ffffff"
            text: "Statistics"
            font.pixelSize: 22
            font.bold: true
        }

    Header{
        id: header
        x:0
        y: 55
        property QtObject window: window
        property bool welcomeBackText: false
        property bool menuButton: true
    }

    Navbar{
        id: navbar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -23
    }

    Text {
        id: catTitle
        x: 23
        y: 249
        color: "#304437"
        text: "Categories"
        font.pixelSize: 20
        font.styleName: "Bold"
        font.bold: true
    }

    Image {
        id: statsIcon
        x: 263
        y: 167
        width: 104
        height: 104
        source: "qrc:/resources/statisticsIcon.png"
        anchors.horizontalCenterOffset: 123
        z: 3
        fillMode: Image.PreserveAspectFit
        anchors.topMargin: 99
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        anchors.margins: 10
        anchors.leftMargin: 43
        anchors.rightMargin: 43
        anchors.topMargin: 285
        anchors.bottomMargin: 72
        contentWidth: 116
        contentHeight: 743
        anchors.top: whiteRectangle.bottom
        anchors.bottom: parent.bottom
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.interactive: false
         ScrollBar.vertical.interactive: false

         Text {
             id: withdrawingsTitle
             x: 81
             y: 36
             width: 143
             height: 17
             color: "#000502"
             textFormat: Text.RichText
             text: "<font style=\"font-size:19px; font-weight:600; color:#689A78\">Withdrawings</font>"
                   + "<br><br>Food - "
                   + "<br>Education - "
                   + "<br>Transportation - "
                   + "<br>Bills - "
                   + "<br>Shopping - "
                   + "<br>Friends & Family - "
                   + "<br>Health - <br>"
                   + "<br><br><font style=\"font-size:19px; font-weight:600; color:#689A78\">Depositings</font>"
                   + "<br><br>Food - "
                   + "<br>Education - "
                   + "<br>Transportation - "
                   + "<br>Bills - "
                   + "<br>Shopping - "
                   + "<br>Friends & Family - "
                   + "<br>Health - "
             font.pixelSize: 18
             horizontalAlignment: Text.AlignHCenter
             wrapMode: Text.WordWrap
             z: 3
         }



        }
    }
