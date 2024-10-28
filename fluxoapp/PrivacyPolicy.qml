import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Window {
    id: window
    width: 390
    height: 844
    visible: true

    Rectangle {
        id: background
        width: 420
        height: 844
        visible: true
        color: "#304437"

        Rectangle {
            id: circle
            radius: 360
            z: 0
            rotation: 112
            anchors.horizontalCenterOffset: -327
            width: 670
            height: 670
            anchors.horizontalCenter: parent.horizontalCenter
            y: -254
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#689A78" }
                GradientStop { position: 0.37; color: "#3C5846" }
            }
        }

        Header {
            id: header
            x: 0
            y: 55
            property bool welcomeBackText: false
            property bool menuButton: true
        }

        // Adjusted the order of the Rectangle and ScrollView
        Rectangle {
            id: whiteRectangle
            y: 184
            height: 667
            color: "#fdfdfd"
            radius: 43
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            z: 0

            Text {
                id: _text
                x: 128
                y: 19
                text: qsTr("Privacy Policy")
                font.pixelSize: 22
                font.styleName: "Semibold"
            }
        }

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 10
            anchors.leftMargin: 43
            anchors.rightMargin: 43
            anchors.topMargin: 236
            anchors.bottomMargin: -44
            anchors.top: whiteRectangle.bottom
            anchors.bottom: parent.bottom
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            ScrollBar.horizontal.interactive: false
             ScrollBar.vertical.interactive: false

            Text {
                id: privacyText
                x: 3
                y: 25
                width: 329
                height: 2704
                text: "This Privacy Policy describes Our policies and procedures on the collection,\n"
                    + "use and disclosure of Your information when You use the Service and tells You\n"
                    + "about Your privacy rights and how the law protects You.\n\n"
                    + "We use Your Personal data to provide and improve the Service. By using the\n"
                    + "Service, You agree to the collection and use of information in accordance with\n"
                    + "this Privacy Policy.\n\n"
                    + "Interpretation and Definitions\n\n"
                    + "Interpretation  \n\n"
                    + "The words of which the initial letter is capitalized have meanings defined\n"
                    + "under the following conditions. The following definitions shall have the same\n"
                    + "meaning regardless of whether they appear in singular or in plural.\n\n"
                    + "Definitions  \n\n"
                    + "For the purposes of this Privacy Policy:\n\n"
                    + "  * Account means a unique account created for You to access our Service or\n"
                    + "    parts of our Service.\n\n"
                    + "  * Affiliate means an entity that controls, is controlled by or is under\n"
                    + "    common control with a party, where \"control\" means ownership of 50% or\n"
                    + "    more of the shares, equity interest or other securities entitled to vote\n"
                    + "    for election of directors or other managing authority.\n\n"
                    + "  * Application refers to Fluxo, the software program provided by the Company.\n\n"
                    + "  * Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this\n"
                    + "    Agreement) refers to Fluxo, Burgas, Meden Rudnik.\n\n"
                    + "  * Country refers to: Bulgaria\n\n"
                    + "  * Device means any device that can access the Service such as a computer, a\n"
                    + "    cellphone or a digital tablet.\n\n"
                    + "  * Personal Data is any information that relates to an identified or\n"
                    + "    identifiable individual.\n\n"
                    + "  * Service refers to the Application.\n\n"
                    + "  * Service Provider means any natural or legal person who processes the data\n"
                    + "    on behalf of the Company. It refers to third-party companies or\n"
                    + "    individuals employed by the Company to facilitate the Service, to provide\n"
                    + "    the Service on behalf of the Company, to perform services related to the\n"
                    + "    Service or to assist the Company in analyzing how the Service is used.\n\n"
                    + "  * Usage Data refers to data collected automatically, either generated by the\n"
                    + "    use of the Service or from the Service infrastructure itself (for example,\n"
                    + "    the duration of a page visit).\n\n"
                    + "  * You means the individual accessing or using the Service, or the company,\n"
                    + "    or other legal entity on behalf of which such individual is accessing or\n"
                    + "    using the Service, as applicable.\n\n\n"
                    + "Collecting and Using Your Personal Data  \n\n"
                    + "Personal Data  \n\n"
                    + "While using Our Service, We may ask You to provide Us with certain personally\n"
                    + "identifiable information that can be used to contact or identify You.\n"
                    + "Personally identifiable information may include, but is not limited to:\n\n"
                    + "* For other purposes : We may use Your information for other purposes, such\n"
                    + "    as data analysis, identifying usage trends, determining the effectiveness\n"
                    + "    of our promotional campaigns and to evaluate and improve our Service,\n"
                    + "    products, services, marketing and your experience."
                font.pointSize: 14
                wrapMode: Text.WordWrap
                z: 3
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Navbar {
            id: navbar
            x: -32
            y: 772
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -23
        }
    }
}
