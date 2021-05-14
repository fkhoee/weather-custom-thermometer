import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.4
import Weather 1.0

import "win" as WIN
import "jsonservice.js" as Service

Window {
    id: root
    visible: true
    width: 800
    height: 810
    title: qsTr("Weather app - Fabienne Khoee")

    property FontLoader fontLoader: FontLoader{
        id: fontMontserrat
        source: "qrc:/win/fonts/Montserrat-Regular.ttf"
    }

    property alias fontFamily: fontMontserrat.name

    WIN.FetchBar{
        id: fetchBar
        z: 5
        height: 80
        x: 50
        y: 20
        anchors.bottom: parent.bottom
        anchors.leftMargin: 15
        width: parent.width
        button_width: 220
        opacity: 0.9
        buttonFetchLabel: "datas"

        onButtonStartClicked: {
            tableView.model = 0
            Service.request()
        }
    }

    Rectangle{
        id: background
        anchors.fill: parent;
        color: "#000000"

        gradient: Gradient {
            GradientStop { position: 0.0; color: Core.gradientBg1 }
            GradientStop { position: 1.0; color: Core.gradientBg2 }
        }

        Item {
                id: tableContainer
                visible: true
                width: 440
                height: 360
                x: 80
                y: 20

                TableView {
                    id: tableView
                    frameVisible: true
                    anchors.fill: parent

                    horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                    backgroundVisible: false

                    Component{
                        id:itemDelegateText
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            color: styleData.selected?"#1E90FF":"#000000"
                            elide: styleData.elideMode
                            text: styleData.value

                            font.family: root.fontFamily
                            font.pixelSize: 12
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.fill: parent
                        }
                    }

                    Component{
                        id:itemTemperatureDelegateText
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            color: styleData.selected?"#1E90FF":"#000000"
                            elide: styleData.elideMode
                            text: styleData.value.Metric.Value + "  \xB0C"

                            font.family: root.fontFamily
                            font.pixelSize: 12
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.fill: parent
                        }
                    }

                    Component{
                        id:itemIconDelegateText

                        Rectangle {
                            id: image
                            width: 30
                            height: 30
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            color: "transparent"

                            Image {
                                anchors.fill: parent
                                fillMode: Image.PreserveAspectFit
                                z: 22
                                //source: "qrc:/win/weather_images/icon" + styleData.value + "s.png"
                                source: Service.iconFix(styleData.value)
                            }
                        }
                    }

                    TableViewColumn{
                        role: "EnglishName"
                        title: "City"
                        width: 200
                        delegate: itemDelegateText
                    }

                    TableViewColumn{
                        role: "Temperature"
                        title: "Temperature"
                        width: (tableView.width-200)/2
                        delegate:itemTemperatureDelegateText
                    }

                    TableViewColumn{
                        role: "WeatherIcon"
                        title: "Image"
                        width:(tableView.width-200)/2
                        delegate: itemIconDelegateText
                    }

                    headerDelegate: Rectangle{
                        height: 30
                        border.width: 1
                        color: "#FAEBD7"
                        border.color: "#04f6f6"
                        Text {
                            id: headerName
                            text: styleData.value
                            font.family: fontMontserrat.name
                            font.pixelSize: 15
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.fill: parent
                        }
                    }

                    rowDelegate: Rectangle{
                        id:rowRectangle
                        property color rowColor: styleData.selected?"#FFDEAD":(styleData.alternate ? "#F0FFF0":"#E6E6FA")
                        color:rowColor
                        height: 30

                        Rectangle{
                            x:200
                            height:parent.height
                            width:1
                            color:"black"
                        }

                        Rectangle{
                            x:(tableView.width - 200)/2+200
                            height:parent.height
                            width:1
                            color:"black"
                        }

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: true
                            property bool isClicked: false

                            onClicked: {

                                if(tableView.rowCount > styleData.row){
                                    tableView.selection.clear()
                                    tableView.selection.select(styleData.row)

                                    animThermo.sunArrow.selectedMetricValue = tableView.model[styleData.row]["Temperature"]["Metric"]["Value"]
                                    animThermo.clicked();
                                    console.log("celcius value: " + tableView.model[styleData.row]["Temperature"]["Metric"]["Value"])

                                    celciusAnim.start();

                                    weatherInfo.descriptionCelciusTxt = tableView.model[styleData.row]["Temperature"]["Metric"]["Value"] + "  \xB0C"
                                    weatherInfo.descriptionCityTxt = tableView.model[styleData.row]["EnglishName"]
                                    weatherInfo.descriptionCountryTxt = tableView.model[styleData.row]["Country"]["EnglishName"]
                                    weatherInfo.descriptionWeatherSituationTxt = tableView.model[styleData.row]["WeatherText"]
                                    weatherInfo.descriptionFahrenheitTxt = tableView.model[styleData.row]["Temperature"]["Imperial"]["Value"] + "  \u2109"
                                    weatherInfo.descriptionImage = Service.iconFix(tableView.model[styleData.row]["WeatherIcon"])
                                }
                            }

                            NumberAnimation {
                                id: celciusAnim
                                target: animThermo.sunArrow
                                properties: "y"
                                to: tableView.rowCount > styleData.row ? Service.moveArrow(tableView.model[styleData.row]["Temperature"]["Metric"]["Value"]) : 0
                                easing.type: Easing.InOutSine
                                duration: 500
                            }

                        }

                    }
                }
        }

        WeatherInfo{
            id: weatherInfo
            anchors.top: tableContainer.bottom

        }

        Thermometer{
            id: animThermo
            y: 5
            anchors.left: tableContainer.right
            anchors.leftMargin: 10
        }
    }

}
