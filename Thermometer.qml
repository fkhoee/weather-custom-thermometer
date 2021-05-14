import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

import Weather 1.0
import "win" as WIN
import "jsonservice.js" as Service

Item {
    id: rootThermo

    signal clicked

    onClicked: {
       startThermoAnimation()
    }

    property alias sunArrow: thermometerArrow
    property int duration: 250

    PropertyAnimation{
        target: glowRect
        id: animation1
        duration: rootThermo.duration
        loops: 1
        from: 1.05
        to: 1.2
        property: "scale"
    }

    ParallelAnimation{
        id: animation2
        SequentialAnimation{
            PropertyAnimation{
                target: glowRect
                duration: rootThermo.duration
                loops: 1
                from: 0.2
                to: 1.0
                property: "opacity"
            }
            PropertyAnimation{
                target: glowRect
                duration: rootThermo.duration
                loops: 1
                from: 1.0
                to: 0.0
                property: "opacity"
            }

        }

        SequentialAnimation{
           PropertyAction{
               target: glowRect
               property: "border.width"
               value: 20
           }

           PauseAnimation {
               duration: 200
           }

           PropertyAnimation{
               target: glowRect
               duration: rootThermo.duration
               loops: 1
               from: 20
               to: 10
               property: "border.width"
           }

        }

    }

    Rectangle{
        id: thermometerContainer
        width: 180
        height: 800
        radius: 10
        color: "lightBlue"

        ListView {
            id: thermometerListView
            anchors.fill: parent
            anchors.margins: 20
            clip: true
            model: 101
            delegate: numberDelegate
            spacing: 5
        }

        Component {
            id: numberDelegate
            Rectangle {
                color: "purple"
                width: Service.calculatePosition(index)
                height: 2
                z: 23

                Label {
                    font.family: root.fontFamily
                    anchors.right: parent.right
                    text: Service.calculateTempText(index)
                    font.pixelSize: 14
                }
            }
        }

        Rectangle{
            id: thermometerArrow
            width: 30
            height: 30
            color: "transparent"
            // custom property
            property int selectedMetricValue: 0
            y: Service.defaultYArrow()

            Image{
                id: arrowIcon
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/win/weather_images/sun.png"
                z: 24
            }

            Rectangle{
                id: glowRect
                visible: false
                width: thermometerArrow.width
                height: thermometerArrow.height
                color: "#FF4500"
                radius: 20
                scale: 1.05
                border.color: "#FF4500"
                z: 23
            }
        }

        Item{
            id: textCelciusBottomContainer
            anchors.bottom: thermometerListView.bottom
            z: 24
            x: 75
            anchors.bottomMargin: 15

            Text{
                color: "purple"
                anchors.centerIn: textCelciusBottomContainer
                font.family: root.fontFamily
                font.bold: true
                font.pixelSize: 26
                text: thermometerArrow.selectedMetricValue + " \xB0C"
            }
        }

    }

    DropShadow {
        anchors.fill: thermometerContainer
        horizontalOffset: 3
                   verticalOffset: 3
                   radius: 8.0
                   samples: 17
                   color: "#aa000000"
                   source: thermometerContainer
    }

    function startThermoAnimation(){
        glowRect.visible = true
        animation1.start()
        animation2.start()
    }

}
