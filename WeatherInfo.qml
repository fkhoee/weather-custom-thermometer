import QtQuick 2.0
import Weather 1.0

Item {
    id: weatherDetailContainer

    property alias descriptionCityTxt: descriptionCity.text
    property alias descriptionCountryTxt: descriptionCountry.text
    property alias descriptionCelciusTxt: descriptionCelcius.text
    property alias descriptionFahrenheitTxt: descriptionFahrenheit.text
    property alias descriptionWeatherSituationTxt: descriptionWeatherSituation.text
    property alias descriptionImage: weatherImage.source

    width: 440
    height: 200
    anchors.topMargin: 15
    x: 80

    Rectangle{
        anchors.fill: parent
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#205072" }
            GradientStop { position: 1.0; color: "#329D9C" }
        }
        radius: 8

        Text{
            id: desctCity
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: "City: "
            x: 15
            y: 15
        }

        Text {
            id: descriptionCity
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: ""
            x: 130
            y: 15
        }

        Text {
            id: desctCountr
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: "Country: "
            x: 15
            y: 35
        }

        Text {
            id: descriptionCountry
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: ""
            x: 130
            y: 35
        }

        Text {
            id: desctTempCelcius
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: "Temperature: "
            x: 15
            y: 55
        }

        Text{
            id: descriptionCelcius
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: ""
            x: 130
            y: 55
        }

        Text {
            id: desctTempCelciusFahrenheit
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: "Fahrenheit: "
            x: 15
            y: 75
        }

        Text {
            id: descriptionFahrenheit
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: ""
            x: 130
            y: 75
        }

        Text {
            id: desctWeatherSituation
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: "Situation: "
            x: 15
            y: 95
        }

        Text {
            id: descriptionWeatherSituation
            color: "white"
            font.family: root.fontFamily
            font.pixelSize: 14
            text: ""
            x: 130
            y: 95
        }

        Image {
            id: weatherImage
            anchors.right: parent.right
            y: 15
            width: 200
            height: 200
            fillMode: Image.PreserveAspectFit
            source: ""
        }

        LogoAccuWeather{
            id: accuWeatherLogo
            x: 14
            anchors.topMargin: 10
            anchors.top: desctWeatherSituation.bottom
        }
    }

}
