import QtQuick 2.7

Rectangle{
    /*
    params to be set:
    name: string - budget name
    category: string - category
    outOf: string - a string, containing progress (100/200 BGN)
    */
    width: 294
    height: 92
    radius: 20
    color: "#F1F1F1"

    Text{
        id: name
        text: parent.name

        x: 18
        y: 11
        width: 233
        height: 23


        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 700
        font.pixelSize: 18
    }


    Rectangle{

        x: 251
        y: 11
        width: 24
        height: 24

        Image{
            anchors.fill: parent
            source: "qrc:/resources/penCircle.png"

        }
        MouseArea{
            anchors.fill: parent
        }
    }



    Text{
        id: categoryText
        text: parent.category

        width: 67
        height: 11
        x: 18
        y: 66

        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 400
        font.pixelSize: 14
        color: "#898989"
    }

    Text{
        id: outOf
        text: parent.outOf

        x:157
        y:65

        width: 130
        height: 18

        font.family: "Inter"
        font.styleName: "normal"
        font.weight: 400
        font.pixelSize: 14
        color: "#898989"
    }
}
