import QtQuick 2.0
import QtQuick.Controls 1.4
import "jsonservice.js" as Service

Item {
        id: tableContainer
        visible: true
        width: 940
        height: 780
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

                    font.pointSize: 12
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

                    font.pointSize: 12
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
                                //source: "qrc:/weather_images/icon" + styleData.value + "s.png"
                                source: Service.iconFix(styleData.value)
                        }
                  }
            }

            TableViewColumn{
                role:"EnglishName"
                title: "City"
                width:200
                delegate: itemDelegateText
            }

            TableViewColumn{
                role:"Temperature"
                title: "Temperature"
                width:(tableView.width-200)/2
                delegate:itemTemperatureDelegateText
            }

            TableViewColumn{
                role: "WeatherIcon"
                title:"Image"
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
                    font.pointSize: 15
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

           }
        }
}
