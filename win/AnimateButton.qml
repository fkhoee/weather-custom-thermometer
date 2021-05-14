import QtQuick 2.6
import QtQuick.Controls 2.0
import Weather 1.0

Item{
    id: container
    signal clicked

    property alias text: label.text
    property color bg_color: "#13547a"
    property alias button_width: buttonRect.width
    property alias button_height: buttonRect.height
    property int duration: 250

    Rectangle{
        id: buttonRect
        width: 400
        height: 80
        radius: 20
        border.color: "#ffffff"
        color: container.bg_color
    }

    Image{
        x: 5
        y: 5
        id: weatherBtn
        width: 50
        height: 50
        source: "images/cloud.png"
    }

    MouseArea{
        id: mouseRegion
        anchors.fill: buttonRect
        hoverEnabled: true
        onEntered: {
           buttonRect.scale = 1.2
        }
        onExited: {
            buttonRect.scale = 1.05
        }
        onClicked: {
            container.clicked();
        }
        onPressed: {
            buttonRect.scale = 1.05
            glowButton.visible = true
            animation1.start()
            animation2.start()
        }
    }

    Label{
        id: label
        color: "#ffffff"
        anchors.centerIn: buttonRect;
        font.family: Core.fontFamily
        font.pixelSize: 28
        text: qsTr("Label")
    }

    Rectangle{
        id: glowButton
        visible: false
        width: container.button_width
        height: container.button_height
        color: "#ffffff"
        radius: 20
        scale: 1.05
        border.color: "#ffffff"
        z: -1
    }

    PropertyAnimation{
        target: glowButton
        id: animation1
        duration: container.duration
        loops: 1
        from: 1.05
        to: 1.2
        property: "scale"
    }

    ParallelAnimation{
        id: animation2
        SequentialAnimation{
            PropertyAnimation{
                target: glowButton
                duration: container.duration
                loops: 1
                from: 0.2
                to: 1.0
                property: "opacity"
            }
            PropertyAnimation{
                target: glowButton
                duration: container.duration
                loops: 1
                from: 1.0
                to: 0.0
                property: "opacity"
            }

            PropertyAction{
                target: glowButton
                property: "visible"
                value: false
            }
        }

        SequentialAnimation{
           PropertyAction{
               target: glowButton
               property: "border.width"
               value: 20
           }


           PauseAnimation {
               duration: 200
           }

           PropertyAnimation{
               target: glowButton
               duration: container.duration
               loops: 1
               from: 20
               to: 10
               property: "border.width"
           }

        }

    }

}
