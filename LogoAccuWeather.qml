import QtQuick 2.0
import QtGraphicalEffects 1.0

Item{
    id: accuWeatherContainer
    signal clicked

    property int duration: 250

    PropertyAnimation{
        target: glowAccuWeatherLogo
        id: animation1
        duration: accuWeatherContainer.duration
        loops: 1
        from: 1.05
        to: 1.2
        property: "scale"
    }

    ParallelAnimation{
        id: animation2
        SequentialAnimation{
            PropertyAnimation{
                target: glowAccuWeatherLogo
                duration: accuWeatherContainer.duration
                loops: 1
                from: 0.2
                to: 1.0
                property: "opacity"
            }
            PropertyAnimation{
                target: glowAccuWeatherLogo
                duration: accuWeatherContainer.duration
                loops: 1
                from: 1.0
                to: 0.0
                property: "opacity"
            }

            PropertyAction{
                target: glowAccuWeatherLogo
                property: "visible"
                value: false
            }
        }

        SequentialAnimation{
           PropertyAction{
               target: glowAccuWeatherLogo
               property: "border.width"
               value: 20
           }


           PauseAnimation {
               duration: 200
           }

           PropertyAnimation{
               target: glowAccuWeatherLogo
               duration: accuWeatherContainer.duration
               loops: 1
               from: 20
               to: 10
               property: "border.width"
           }

        }

    }

    Rectangle{
        id: accuWeatherRect
        width: 60
        height: 60
        radius: 4
        color: "#FAEBD7"

        Image{
            id: accuWeatherLogoIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/win/weather_images/accuWeather.png"
            z: 25
        }

        Rectangle{
            id: glowAccuWeatherLogo
            visible: false
            width: accuWeatherRect.width
            height: accuWeatherRect.height
            color: "#ffffff"
            radius: 10
            scale: 1.05
            border.color: "#ffffff"
            z: -1
        }

        DropShadow {
            anchors.fill: accuWeatherLogoIcon
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#aa000000"
            source: accuWeatherLogoIcon
        }

        MouseArea{
            id: mouseRegionAccuLogo
            anchors.fill: accuWeatherRect
            hoverEnabled: true
            onEntered: {
               accuWeatherRect.scale = 1.3
            }
            onExited: {
                accuWeatherRect.scale = 1.05
            }

            onClicked: {
                accuWeatherContainer.clicked();
            }

            onPressed: {
                accuWeatherRect.scale = 1.05
                glowAccuWeatherLogo.visible = true
                animation1.start()
                animation2.start()
                Qt.openUrlExternally("https://developer.accuweather.com/");
            }
        }
    }
}

